class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :genres,
              :summary

  def initialize(hash)
    @title = hash[:title]
    @vote_average = hash[:vote_average]
    @id = hash[:id]
    @runtime = hash[:runtime]
    @genres = hash[:genres].map do |genre|
      genre[:name]
    end
    require 'pry'; binding.pry
    @summary = hash[:overview]
  end
end
