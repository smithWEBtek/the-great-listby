class GenresController < ApplicationController

  def index
    @genres = Genre.alphabatize
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

end
