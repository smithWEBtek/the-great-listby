class BooksController < ApplicationController
  before_action :set_current_user

  def index
    @books = Book.all
  end

  def new
    authorize! :create, Book
    @book = Book.new
    @booklist = BookList.find_by(id: params[:book_list_id])
    authorize! :update, @booklist
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      update_book_features
      redirect_to book_list_path(@booklist)
    else
      @booklist = BookList.find_by(id: params[:book][:book_list_id])
      render :new
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    if current_user
      @booklists = @book.book_lists.where(user_id: current_user.id)
    end
  end

  def edit
    find_book_and_booklist
    authorize! :update, @booklist
  end

  def update
    @book = Book.find_by(id: params[:id])
    authorize! :update, @book
    @book.update(book_params)
    update_book_features
    if @booklist
      redirect_to book_list_path(@booklist)
    else
      flash[:notice] = "You must select a book list"
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    find_book_and_booklist
    @booklist.books.delete(@book.id)
    flash[:notice] = "Book was deleted from your booklist"
    redirect_to book_list_path(@booklist)
  end

  private
    def book_params
      params.require(:book).permit(:book_list_id, :title, :blurb, :genre_name, :author_name, :book_features => [], :book_list_ids => [])
    end

    def set_current_user
      @user = current_user
    end

    def update_book_features
      @booklist = BookList.find_by(id: params[:book][:book_list_id]) || @booklist = BookList.find_by(id: params[:book][:book_list_ids])
      if @booklist
        @book_features = BookFeature.find_by(book_id: @book.id, book_list_id: @booklist.id)
        @book_features.update_status(params[:book][:book_features])
      end
    end

    def find_book_and_booklist
      @booklist = BookList.find_by(id: params[:book_list_id])
      @book = Book.find_by(id: params[:id])
    end
end
