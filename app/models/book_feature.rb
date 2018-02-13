class BookFeature < ApplicationRecord
  belongs_to :book
  belongs_to :book_list

  def update_status(status)
    self.update_columns(status: status)
  end
end
