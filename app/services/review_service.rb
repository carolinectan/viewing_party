# class ReviewService < ApiService
#   def reviews(movie_id)
#     data = get_data("https://api.themoviedb.org/3/movie/#{movie_id}/reviews").get do |req|
#       req.params['api_key'] = ENV['movie_api_key']
#       req.params['language'] = 'en-US'
#       req.params['page'] = 1
#     end
#
#     # response = Faraday.new("https://api.themoviedb.org/3/movie/436969/reviews").get do |req|
#     #   req.params['api_key'] = 'c4f54a02aa2875bebf5bedbd9afeeb73'
#     #   req.params['language'] = 'en-US'
#     #   req.params['page'] = 1
#     # end
#
#     # JSON.parse(response.body, symbolize_names: true)

# Review.new(result[:author_details])
#               review[:author],
#               review[:author_details][:rating],
#               review[:content],
#               review[:id]
#             )
# end

#   end
# end
