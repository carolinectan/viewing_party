class Movie
  attr_reader :title, :vote_average, :id

  def initialize(title, vote_average, id)
    @title = title
    @vote_average = vote_average
    @id = id
  end
end
