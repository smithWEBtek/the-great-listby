class CreateBookLists < ActiveRecord::Migration[5.1]
  def change
    create_table :book_lists do |t|
			# t.belongs_to :user, foreign_key: true
			t.integer :user_id
      t.string :title
      t.timestamps
    end
  end
end
