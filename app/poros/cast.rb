class Cast
  attr_reader :name, :character

  def initialize(hash)
    @name = hash[:name]
    @character = hash[:character]
  end
end
