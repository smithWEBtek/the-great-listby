class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :book_lists_books
  has_many :book_lists, :through => :book_lists_books
  has_many :reviews
  has_many :users, :through => :reviews
  validates :title, presence: true

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author
  end

  def book_lists_attributes=(book_list_attributes)
    book_list_attributes.values.each do |book_list_attribute|
      if book_list_attribute[:user_id].present? && book_list_attribute[:title].present?
        user = User.find_by(id: book_list_attribute[:user_id])
        book_list = BookList.find_or_create_by(title: book_list_attribute[:title], user: user)
          if !self.book_lists.include?(book_list)
            self.book_lists.build(title: book_list.title, user_id: book_list.user_id)
          end
        end
      end
    end

  def book_list_ids=(ids)
    ids.each do |id|
      book_list = BookList.find_by(id: id)
      if book_list
        self.book_lists << book_list
      end
    end
  end

  def status
    self.book_lists_books.find_by(book_id: self.id).status
  end

  def update_status(status)
    self.book_lists_books.update_all(status: status)
  end

end
