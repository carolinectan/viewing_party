class ReviewService < ApiService
  def reviews(movie_id)
    data = get_data("https://api.themoviedb.org/3/#{movie_id}/436969/reviews").get do |req|
      req.params['api_key'] = ENV['movie_api_key']
      req.params['language'] = 'en-US'
      req.params['page'] = 1
    end

    parsed_data = get_json(data)

    parsed_data[:results].map do |review|
      Review.new(
                  review[:author],
                  review[:author_details][:name],
                  review[:author_details][:rating],
                  review[:content],
                  review[:id]
                )
    end
  end
end
