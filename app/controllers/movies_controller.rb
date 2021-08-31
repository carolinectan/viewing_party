class MoviesController < ApplicationController
  def index
    @movies = MovieService.new.top_40
  end

  def show
    @movie = MovieService.new.details(params[:id])
    @cast = MovieService.new.cast(params[:id]).cast[0..9]
  end
end
