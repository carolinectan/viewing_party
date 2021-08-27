class MovieService < ApiService
  
  def top_movies
    get_data(https://api.themoviedb.org/3/movie/popular?language=en-US&page=1).get do |req|
      req.params["api_key"] = ENV["movie_api_key"]
    end
  end

end
