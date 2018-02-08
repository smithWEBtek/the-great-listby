class BookListsBook < ApplicationRecord
  belongs_to :book
  belongs_to :book_list

#BookListsBook.last.update_columns(status: "read")
#test_book.book_lists_books.update_all(status: "READ")
#test_book_list.book_lists_book.update_all(status: "new status")

end
