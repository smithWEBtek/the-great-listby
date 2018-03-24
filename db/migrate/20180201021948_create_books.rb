class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :blurb
      t.datetime :date_started
      t.datetime :date_completed
			# t.belongs_to :author, foreign_key: true
			t.integer :author_id
			# t.belongs_to :genre, foreign_key: true
			t.integer :genre_id

      t.timestamps
    end
  end
end
