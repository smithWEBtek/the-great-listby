class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :book_lists
  has_many :users, :through => :book_lists
  has_many :reviews
  has_many :users, :through => :reviews
  validates :title, presence: true
  validates :title, uniqueness: true

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author
  end

  def book_lists_attributes=(book_list_attributes)
    book_list_attributes.values.each do |book_list_attribute|
      user = User.find_by(id: book_list_attribute[:user_id])
      book_list = BookList.find_or_create_by(title: book_list_attribute[:title], user: user)
      self.book_lists.build(title: book_list.title, user_id: book_list.user_id)
      end
    end

end
