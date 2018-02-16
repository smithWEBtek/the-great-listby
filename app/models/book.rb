class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :book_features
  has_many :book_lists, :through => :book_features
  has_many :reviews
  has_many :users, :through => :reviews

  validates :title, presence: true
  validates :author_id, presence: true
  validates :genre_id, presence: true

  scope :highest_rated_books, -> { joins(:reviews).where('reviews.rating > 3') }
  scope :lowest_rated_books, -> { joins(:reviews).where('reviews.rating <= 3') }
  scope :by_user, ->(user) { joins(:reviews).where('reviews.user_id = ?', user.id ) }

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name.titleize)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name.titleize)
  end

  def author_name
    if self.author
      self.author.name
    end
  end

  def book_list_id=(id)
    book_list = BookList.find_by(id: id)
    if book_list
      if !self.book_lists.include?(book_list)
        self.book_lists << book_list
      end
    end
  end

  def book_list_ids=(ids)
    ids.each do |id|
      book_list = BookList.find_by(id: id)
      if book_list
        if !book_list.books.include?(self)
          book_list.books << self
        end
      end
    end
  end

  def update_status(status, book_list_id: nil, book_list_ids: nil)
    if book_list_id != nil
      book_feature = BookFeature.find_by(book_id: self.id, book_list_id: book_list_id)
      book_feature.update_columns(status: status)
    end

    if book_list_ids != nil
      book_list_ids.each do |book_list|
        new_book_list = BookList.find_by(id: book_list)
        book_feature = BookFeature.find_by(book_id: self.id, book_list_id: new_book_list.id)
        book_feature.update_columns(status: status)
      end
    end
  end
end
