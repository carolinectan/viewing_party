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

    parsed_data[:results].map do |movie|
      Movie.new(movie[:title], movie[:vote_average], movie[:id])
    end
  end

  def details(movie_id)
    data = get_data("https://api.themoviedb.org/3/movie/#{movie_id}").get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['page'] = 1 # what if there are more than one page of reviews?
    end

    parsed_data = get_json(data)

    parsed_data[:results].map do |movie|
      Movie.new(movie[:title], movie[:vote_average], movie[:id])
    end
  end
end