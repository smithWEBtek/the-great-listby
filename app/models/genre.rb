class Genre < ApplicationRecord
  has_many :books
  has_many :authors, :through => :books
  validates :name, uniqueness: true
  validates :name, presence: true

end
