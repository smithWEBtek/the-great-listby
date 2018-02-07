class BookListsController < ApplicationController

  def index
    @booklists = current_user.book_lists
  end

  def new
    @booklist = BookList.new
    @user = current_user
  end

  def create
    @user = current_user
    @booklist = BookList.create(book_list_params)
    if @booklist.save
      redirect_to book_list_path(@booklist)
    else
      render :new
    end
  end

  def show
    @booklist = BookList.find_by(id: params[:id])
  end

  private
   def book_list_params
     params.require(:book_list).permit(:title, :user_id, :book_ids => [], :books_attributes => [:title, :genre, :author])
   end

end
