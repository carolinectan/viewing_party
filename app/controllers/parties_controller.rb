class PartiesController < ApplicationController
  def new
    @party = Party.new
    @movie = MovieService.new.details(params[:movie_id])
  end

  def create
    @party = Party.create(party_params)
    redirect_to dashboard_path
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time, :movie_id, :user_id)
  end
end