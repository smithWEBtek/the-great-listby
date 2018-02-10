class BookFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :book_features do |t|
      t.belongs_to :book
      t.belongs_to :book_list
      t.string :status
    end
  end
end
