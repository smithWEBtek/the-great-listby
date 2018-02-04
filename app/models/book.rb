class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :book_lists
  has_many :users, :through => :book_lists
  has_many :reviews
  has_many :users, :through => :reviews

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    binding.pry
    self.genre.name
  end

end
