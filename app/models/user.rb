class User < ApplicationRecord
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
    users_books = []
    BookList.where(user_id: self.id).each do |booklist|
        booklist.books.each do |book|
          users_books << book
      end
    end
    users_books
  end

  def books_by_status(status)
    books_by_status = []
    BookList.where(user_id: self.id).each do |booklist|
      BookFeature.where(book_list_id: booklist.id).each do |book|
        if book.status == "#{status}"
          new_book = Book.find_by(id: book.book_id)
          books_by_status << new_book
        end
      end
    end
    books_by_status
  end

end
