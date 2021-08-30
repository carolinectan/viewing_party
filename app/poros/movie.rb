class Movie
  attr_reader :title, :vote_average, :id

  def initialize(hash)
    @title = hash[:title]
    @vote_average = hash[:vote_average]
    @id = hash[:id]
  end
end
