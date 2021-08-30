class MovieService < ApiService
  def top_40
    (top_movies(1) + top_movies(2)).flatten
  end

  def top_movies(page_number)
    data = get_data('https://api.themoviedb.org/3/movie/popular').get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['page'] = page_number
    end

    parsed_data = get_json(data)
    
    parsed_data[:results].map do |result|
      Movie.new(result)
    end
  end

  def details(movie_id)
    data = get_data("https://api.themoviedb.org/3/movie/#{movie_id}").get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['language'] = 'en-US'
    end

    parsed_data = get_json(data)

    Movie.new(parsed_data)
  end
end
