class Genre < ApplicationRecord
  has_many :books
  has_many :authors, :through => :books
  validates :name, uniqueness: true
  validates :name, presence: true

  def books_attributes=(book_attributes)
    book_attributes.values.each do |book_attribute|
      author = Author.find_or_create_by(name: book_attribute[:author])
      book = Book.find_or_create_by(title: book_attribute[:title], author: author)
      self.books.build(title: book.title, author: book.author)
    end
  end
end
