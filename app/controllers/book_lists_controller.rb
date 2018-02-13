class BookListsController < ApplicationController
  before_action :set_current_user

  def index
    authorize! :read, BookList
    @booklists = current_user.book_lists
  end

  def new
    authorize! :create, BookList
    @booklist = BookList.new
  end

  def create
    @booklist = BookList.create(book_list_params)
    authorize! :create, BookList
    if @booklist.save
      update_book_features
      redirect_to book_list_path(@booklist)
    else
      render :new
    end
  end

  def show
    @booklist = BookList.find_by(id: params[:id])
    authorize! :read, @booklist
  end

  def edit
    @booklist = BookList.find_by(id: params[:id])
  end

  def update
    @booklist = BookList.find_by(id: params[:id])
    authorize! :update, @booklist
    @booklist.update(book_list_params)
    update_book_features
    redirect_to book_list_path(@booklist)
  end

  def destroy
    @booklist = BookList.find_by(id: params[:id])
    authorize! :destroy, @booklist
    @booklist.destroy
    redirect_to book_lists_path
  end

  private
   def book_list_params
     params.require(:book_list).permit(:title, :user_id, :book_ids => [], :books_attributes => [:title, :genre, :author, :blurb], :book_features => [])
   end

   def set_current_user
     @user = current_user
   end

   def update_book_features
     @book = Book.find_by(id: params[:book_list][:book_ids]) || @book = Book.find_by(id: @booklist.books.ids)
     @book_features = BookFeature.find_by(book_id: @book.id, book_list_id: @booklist.id)
     @book_features.update_status(params[:book_list][:book_features])
   end

end
