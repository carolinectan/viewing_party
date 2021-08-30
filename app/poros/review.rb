class Review
  attr_reader :author, :name, :rating, :content, :id

  def initialize(author, name, rating, content, id)
    @author = author
    @name = name
    @rating = rating
    @content = content
    @id = id
  end
end
