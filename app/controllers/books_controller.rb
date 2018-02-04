class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.blurb = params[:book][:blurb]
    @book.genre = Genre.find_or_create_by(name: params[:book][:genre])
    @book.author = Author.find_or_create_by(name: params[:book][:author])
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  private
    def book_params
      params.require(:book).permit(:title, :blurb, :date_started, :date_completed, :genre_name)
    end
end
