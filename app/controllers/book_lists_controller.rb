class BookListsController < ApplicationController
  before_action :set_current_user

  def index
    @booklists = current_user.book_lists
  end

  def new
    @booklist = BookList.new
  end

  def create
    @booklist = BookList.create(book_list_params)
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

  def update
    @booklist = BookList.find_by(id: params[:id])
    @booklist.update(book_list_params)
    update_book_features
    redirect_to book_list_path(@booklist)
  end

  def destroy
    @booklist = BookList.find_by(id: params[:id])
    @booklist.destroy
    redirect_to root_path
  end

  private
   def book_list_params
     params.require(:book_list).permit(
       :title,
       :user_id,
       :book_ids => [],
       :books_attributes => [:title, :genre, :author, :blurb],
       :book_features => []
     )
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
