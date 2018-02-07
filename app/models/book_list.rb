class BookList < ApplicationRecord
  belongs_to :user
  has_many :book_lists_books
  has_many :books, :through => :book_lists_books

end
