class RemovedateStartedfrombooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :date_started
    remove_column :books, :date_completed
  end
end
