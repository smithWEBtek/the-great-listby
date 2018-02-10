class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @booklist = BookList.find_by(id: params[:book_list_id])
    @user = current_user
    @book.book_features.build
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      @booklist = BookList.find_by(id: params[:book][:book_list_id])
      @book_features = BookFeature.find_by(id: @book.book_features.ids)
      @book_features.update_status(params[:book][:book_features])
      redirect_to book_list_path(@booklist)
    else
      render :new
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    @booklists = @book.book_lists.where(user_id: current_user.id)
  end

  def edit
    @book = Book.find_by(id: params[:id])
    @booklist = BookList.find_by(id: params[:book_list_id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(book_params)
    @booklist = BookList.find_by(id: params[:book][:book_list_id])
    @book_features = BookFeature.find_by(book_id: @book.id, book_list_id: @booklist.id)
    @book_features.update_status(params[:book][:book_features])
    redirect_to book_list_path(@booklist)
  end

  def destroy
    @booklist = BookList.find_by(id: params[:book_list_id])
    @book = Book.find_by(id: params[:id])
    @booklist.books.delete(@book.id)
    redirect_to book_list_path(@booklist)
  end

  private
    def book_params
      params.require(:book).permit(:book_list_id, :title,
        :blurb,
        :genre_name,
        :author_name,
        :book_features => [])
    end
end
