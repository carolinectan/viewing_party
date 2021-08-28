class MovieService < ApiService
  def page_1
    top_movies(1)
  end
  
  def page_2
    top_movies(2)
  end

  def top_movies(page_number)
    data = get_data("https://api.themoviedb.org/3/movie/popular?language=en-US&page=#{page_number}").get do |req|
      req.params['api_key'] = ENV['movie_api_key']
    end
    
    parsed_data = parsed(data)

    parsed_data[:results].map do |movie|
      Movie.new(movie[:title], movie[:vote_average])
    end
  end
end
