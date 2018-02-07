class BookListsBook < ApplicationRecord
  belongs_to :book
  belongs_to :book_list
end
