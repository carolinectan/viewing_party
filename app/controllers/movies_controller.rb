class MoviesController < ApplicationController
  def index
    @movies = MovieService.new.top_40
  end

  def show
    # @reviews = ReviewService.new.reviews(params[:id])
  end
end
