class MovieService < ApiService
  attr_reader :movies

  def top_movies
    data = get_data('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1').get do |req|
      req.params['api_key'] = ENV['movie_api_key']
    end
    
    parsed_data = parsed(data)

    parsed_data[:results].map do |movie|
      Movie.new(movie[:title], movie[:vote_average])
    end
  end
end
