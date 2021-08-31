class Review
  attr_reader :author, :rating, :content, :id

  def initialize(hash)
    @author = hash[:author]
    @rating = hash[:author_details][:rating]
    @content = hash[:content]
    @id = hash[:id]
  end

  # could add an average rating method for all reviews
end
