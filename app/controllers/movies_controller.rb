class MoviesController < ApplicationController
  def index
    @movies = MovieService.new.top_40
  end

  def show
  end
end
