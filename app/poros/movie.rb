class Movie
  attr_reader :title, :vote_average, :id

  def initialize(title, vote_average, id)
    @title = title
    @vote_average = vote_average
    @id = id
  end

  # def initialize(hash)
  #   @title = hash[:title]
  #   @vote_average = hash[:vote_average]
  #   @id = hash[:id]
  # end

  #will create movie object with values or with nil
end
