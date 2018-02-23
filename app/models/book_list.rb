class BookList < ApplicationRecord
  belongs_to :user
  has_many :book_features
  has_many :books, :through => :book_features
  validates :title, :presence => true

  def books_attributes=(book_attributes)
    book_attributes.values.each do |book_attribute|
    if book_attribute[:title].present? && book_attribute[:genre].present? && book_attribute[:author].present?
        genre = Genre.find_or_create_by(name: book_attribute[:genre].titleize)
        author = Author.find_or_create_by(name: book_attribute[:author].titleize)
        book = Book.find_or_create_by(title: book_attribute[:title].titleize, genre: genre, author: author)
          if !self.books.include?(book)
            self.books << book
          end
        end
      end
    end

  def book_ids=(ids)
    ids.each do |id|
      book = Book.find_by(id: id)
      if !self.books.include?(book)
        self.books << book
      end
    end
  end
end
