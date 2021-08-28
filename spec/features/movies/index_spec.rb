require 'rails_helper'

RSpec.describe "Movies index page" do
  describe 'features' do
    it 'displays top 40 results from search' do
      visit movies_path

      expect(page).to have_content("Top 40 Movies")
    end
  end

  describe 'navigation' do
    before :each do
      json_response = File.read("spec/fixtures/top_40.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=c4f54a02aa2875bebf5bedbd9afeeb73&language=en-US&page=1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.7.0'
           }).
         to_return(status: 200, body: json_response, headers: {})
    end

    it 'links to movie show page through movie title' do
      visit movies_path

      within "#movie-id-436969" do
        click_on "The Suicide Squad"
      end

      expect(current_path).to eq(movie_path(436969))
    end
  end
end

# As an authenticated user,
# When I visit the movies page,
# I should see the 40 results from my search,
# I should also see the "Find Top Rated Movies" button and the Find Movies form at the top of the page.

# Details: The results from the search should appear on this page,
# and there should only be a maximum of 40 results.
# The following details should be listed for each movie.

# Title (As a Link to the Movie Details page)
# Vote Average of the movie
