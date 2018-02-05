class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
    3.times do
      @author.books.build
    end
  end

  def show
    @author = Author.find_by(id: params[:id])
  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def author_params
    params.require(:author).permit(:name, :book_ids => [], books_attributes: [:title, :genre])
  end

end
