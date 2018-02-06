class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
    3.times do
      @genre.books.build
    end
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render :new
    end
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

  private
    def genre_params
      params.require(:genre).permit(:name, :book_ids => [], books_attributes: [:title, :author])
    end

end
