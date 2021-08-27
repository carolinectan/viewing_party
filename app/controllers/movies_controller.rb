class MoviesController < ApplicationController
  def index
    @movies = MovieService.new
  end
end