class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :book_lists
  has_many :reviews

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def books
    @books = []
    @booklists = BookList.where(user_id: self.id)
    @booklists.each do |booklist|
      booklist.books.each do |book|
        @books << book
      end
    end
    @books
  end

  def unread_books
    self.books.each do |book|
      book.book_features.find_by(book_id: book.id, book_list_id: @booklist.id).status
  end
end

end
