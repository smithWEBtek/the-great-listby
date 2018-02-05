class Author < ApplicationRecord
  has_many :books
  has_many :genres, :through => :books
  validates :name, presence: true
  validates :name, uniqueness: true

  def books_attributes=(book_attributes)
    book_attributes.values.each do |book_attribute|
      genre = Genre.find_or_create_by(book_attribute[:name])
      book = Book.find_or_create_by(title: book_attribute[:title], genre: genre)
      binding.pry
      self.books.create(book)
    end
  end
end
