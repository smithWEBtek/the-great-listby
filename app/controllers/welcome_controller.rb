class WelcomeController < ApplicationController

  def home
    if current_user
      @user = current_user
    else
      @user = User.find_by_id(session[:user_id])
    end
      @user.save if @user
      current_user = @user
  end 


end
