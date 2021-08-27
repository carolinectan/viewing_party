class MovieService < ApiService
  def top_movies
    data = get_data('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1').get do |req|
      req.params['api_key'] = ENV['movie_api_key']
    end
  end
require "pry"; binding.pry
  @movies = data[:results].map do |movie|
    movie['title']
    movie['vote average']
  end


end
