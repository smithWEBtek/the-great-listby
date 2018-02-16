class Genre < ApplicationRecord
  has_many :books
  has_many :authors, :through => :books
  validates :name, presence: true
  scope :alphabatize, -> { order('name asc') }
end
