class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @user = current_user
    @book.book_features.build
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      @book_features = BookFeature.find_by(id: @book.book_features.ids)
      @book_features.update_status(params[:book][:book_features])
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  private
    def book_params
      params.require(:book).permit(:title,
        :blurb,
        :genre_name,
        :author_name,
        :book_list_ids => [],
        book_lists_attributes: [:title, :user_id],
        :book_features => [])
    end
end
