class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
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
    params.require(:author).permit(:name)
  end

end
