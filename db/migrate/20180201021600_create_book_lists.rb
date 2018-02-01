class CreateBookLists < ActiveRecord::Migration[5.1]
  def change
    create_table :book_lists do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.string :status, default: "Not Read"
      t.string :title

      t.timestamps
    end
  end
end
