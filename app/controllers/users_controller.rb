class UsersController < ApplicationController

  def reviews
    @user = User.find_by_id(params[:id])
    if @user == current_user
      @reviews = @user.reviews
      render 'users/reviews'
    else
      flash[:notice] = "You're not authorized to do that"
      redirect_to root_path
    end
  end

  def highest_rated_books
    @books = []
    @user = User.find_by_id(params[:id])
    if @user == current_user
      Book.highest_rated_books.by_user(@user).each do |book|
        @books << book
      end
    else
      flash[:notice] = "You're not authorized to do that"
      redirect_to root_path
    end
    @books
  end

  def lowest_rated_books
    @books = []
    @user = User.find_by_id(params[:id])
    if @user == current_user
      Book.lowest_rated_books.by_user(@user).each do |book|
        @books << book
      end
    else
      flash[:notice] = "You're not authorized to do that"
      redirect_to root_path
    end
    @books
  end
end
