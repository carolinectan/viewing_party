class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :genres,
              :summary,
              :cast,
              :reviews

  def initialize(movie_hash, reviews, cast)
    @title = movie_hash[:title]
    @vote_average = movie_hash[:vote_average]
    @id = movie_hash[:id]
    @runtime = movie_hash[:runtime]
    @genres = movie_hash[:genres]
    @summary = movie_hash[:overview]
    @reviews = reviews
    # @cast = hash[:cast]
    @cast = cast
  end
end
