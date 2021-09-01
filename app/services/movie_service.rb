class MovieService < ApiService
  def top40
    (top_movies(1) + top_movies(2)).flatten
  end

  def top_movies(page_number)
    data = get_data('https://api.themoviedb.org/3/movie/popular').get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['page'] = page_number
    end

    parsed_data = get_json(data)

    parsed_data[:results].map do |result|
      Movie.new(result, nil, nil)
    end
  end

  def details(movie_id)
    movie_data = get_data("https://api.themoviedb.org/3/movie/#{movie_id}").get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['language'] = 'en-US'
    end

    movie_parsed_data = get_json(movie_data)
    movie_parsed_data[:genres] = get_genres(movie_parsed_data[:genres])

    reviews_data = get_data("https://api.themoviedb.org/3/movie/#{movie_id}/reviews").get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['language'] = 'en-US'
      req.params['page'] = 1
    end

    reviews_parsed_data = get_json(reviews_data)

    reviews = reviews_parsed_data[:results].map do |result|
      Review.new(result)
    end

    cast_data = get_data("https://api.themoviedb.org/3/movie/#{movie_id}/credits").get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['language'] = 'en-US'
    end

    cast_parsed_data = get_json(cast_data)

    cast = cast_parsed_data[:cast][0..9].map do |member|
      Cast.new(member)
    end

    Movie.new(movie_parsed_data, reviews, cast)
  end

  def get_genres(array)
    array.map do |genre|
      genre[:name]
    end
  end
end
