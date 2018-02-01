class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.string :title
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
