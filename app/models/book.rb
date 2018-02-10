class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :book_features
  has_many :book_lists, :through => :book_features
  has_many :reviews
  has_many :users, :through => :reviews
  validates :title, presence: true

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
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

end
