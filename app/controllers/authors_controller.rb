class AuthorsController < ApplicationController
  def index
    @authors = Author.alphabatize
  end

  def show
    @author = Author.find_by(id: params[:id])
  end
end
