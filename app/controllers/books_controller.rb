class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  private
    def book_params
      params.require(:book).permit(:title, :blurb, :date_started, :date_completed, :genre_name, :author_name)
    end
end
