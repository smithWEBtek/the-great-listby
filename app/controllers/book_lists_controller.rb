class BookListsController < ApplicationController

  def index
    @booklists = current_user.book_lists
  end

  def new
    @booklist = BookList.new
  end

  def create
    @booklist = BookList.create(book_list_params)
    if @booklist.save
      redirect_to book_list_path(@booklist)
    else
      render :new
    end
  end

  private
   def book_list_params
     params.require(:book_list).permit(:title, :book_ids => [])
   end

end
