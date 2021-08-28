class MoviesController < ApplicationController
  def index
    @movies = MovieService.new.top_movies
  end
end