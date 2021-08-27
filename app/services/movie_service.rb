class MovieService < ApiService
  attr_reader :movies

  def top_movies
    data = get_data('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1').get do |req|
      req.params['api_key'] = ENV['movie_api_key']
    end

    @movies = []

    data[:results].each do |movie|
      @movies << Movie.new(movie[:title], movie[:vote_average])
    end
  end

  # should movies live here
  # controller / how can we access @movies array
  # MovieService.new.movies
  # how to utilize the poro
end
