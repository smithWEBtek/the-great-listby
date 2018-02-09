class ReviewsController < ApplicationController
  def index
    @reviews = current_user.reviews
  end

  def new
    @review = Review.new
    @book = Book.find_by(id: params[:book_id])
    @user = current_user
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to book_review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
    @book = Book.find_by(id: params[:book_id])
  end


  private
    def review_params
      params.require(:review).permit(:title, :content, :book_id, :user_id)
    end
end
