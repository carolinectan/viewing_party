class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :genres,
              :summary,
              :cast

  def initialize(hash)
    @title = hash[:title]
    @vote_average = hash[:vote_average]
    @id = hash[:id]
    @runtime = hash[:runtime]
    @genres = hash[:genres]
    @summary = hash[:overview]
    @cast = hash[:cast]
  end
end
