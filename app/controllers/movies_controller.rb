class MoviesController < ApplicationController
  def index
    @movies1 = MovieService.new.page_1
    @movies2 = MovieService.new.page_2
  end
end
