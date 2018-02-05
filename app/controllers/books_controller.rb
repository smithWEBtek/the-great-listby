class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
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
      params.require(:book).permit(:title, :blurb, :date_started, :date_completed, :genre_name, :author_name, :book_list_ids => [], book_lists_attributes: [:title])
    end
end
