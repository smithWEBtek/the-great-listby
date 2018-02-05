class Author < ApplicationRecord
  has_many :books
  has_many :genres, :through => :books
  validates :name, presence: true
  validates :name, uniqueness: true

  def books_attributes=(book_attributes)
    book_attributes.values.each do |book_attribute|
      genre = Genre.find_or_create_by(name: book_attribute[:genre])
      book = Book.find_or_create_by(title: book_attribute[:title], genre: genre)
      self.books.build(title: book.title, genre: book.genre)
    end
  end
end
