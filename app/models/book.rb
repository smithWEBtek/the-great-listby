class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :book_lists
  has_many :users, :through => :book_lists
  has_many :reviews
  has_many :users, :through => :reviews

end
