class Removeblurbfrombooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :blurb
  end
end
