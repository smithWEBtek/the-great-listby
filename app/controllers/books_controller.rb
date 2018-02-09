class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @user = current_user
    @book.book_lists_books.build
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      @book.update_status(params[:book][:book_lists_books])
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
        :blurb, :date_started,
        :date_completed,
        :genre_name,
        :author_name,
        :book_list_ids => [],
        book_lists_attributes: [:title, :user_id],
        :book_lists_books => [])
    end
end
