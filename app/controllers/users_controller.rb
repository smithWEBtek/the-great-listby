class UsersController < ApplicationController

  def reviews
    @user = current_user
    render 'users/reviews'
  end

  def unread
    @unread_books = User.books.unread
  end

end
