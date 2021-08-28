require 'rails_helper'

RSpec.describe "Movies index page" do
  describe 'features' do
    it 'displays top 40 results from search' do
      visit movies_path

      expect(page).to have_content("Top 40 Movies")
    end
  end

  describe 'navigation' do
    it 'links to movie show page through movie title' do
      visit movies_path

      within "#movie-id-436969" do
        click_on "The Suicide Squad"
      end
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
