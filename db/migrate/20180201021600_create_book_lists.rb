class CreateBookLists < ActiveRecord::Migration[5.1]
  def change
    create_table :book_lists do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.timestamps
    end
  end
end
