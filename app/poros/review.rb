class Review
  attr_reader :author, :rating, :content, :id

  def initialize(author, rating, content, id)
    @author = author
    @rating = rating
    @content = content
    @id = id
  end
end
