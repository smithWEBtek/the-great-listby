class BookList < ApplicationRecord
  belongs_to :user
  has_many :book_lists_books
  has_many :books, :through => :book_lists_books

  def books_attributes=(book_attributes)
    book_attributes.values.each do |book_attribute|
    if book_attribute[:title].present? && book_attribute[:genre].present? && book_attribute[:author].present?
        genre = Genre.find_or_create_by(name: book_attribute[:genre])
        author = Author.find_or_create_by(name: book_attribute[:author])
        book = Book.find_or_create_by(title: book_attribute[:title], genre: genre, author: author)
          if !self.books.include?(book)
            self.books.build(title: book.title, genre: book.genre, author: book.author)
          end
        end
      end
    end

  def book_ids=(id)
    id.each do |i|
    book = Book.find_by(id: i)
      if book
        self.books << book
      end
    end
  end

end
