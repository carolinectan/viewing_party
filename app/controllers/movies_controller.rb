class MoviesController < ApplicationController
  def index
    @movies = MovieService.new.top_40
  end
end
