class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true
  scope :alphabatize, -> { order('name asc') }
end
