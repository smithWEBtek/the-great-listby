class UsersController < ApplicationController

  def reviews
    @user = current_user
    render 'users/reviews'
  end
  
end
