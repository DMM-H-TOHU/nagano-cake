class Admin::GenresController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to request.referer

  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end