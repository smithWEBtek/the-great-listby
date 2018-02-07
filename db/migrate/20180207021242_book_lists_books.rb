class BookListsBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :book_lists_books do |t|
      t.belongs_to :book
      t.belongs_to :book_list
      t.string :status, default: "Not Read"
    end
  end
end
