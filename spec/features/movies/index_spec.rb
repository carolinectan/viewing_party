require 'rails_helper'

RSpec.describe "Movies index page" do
  describe 'features' do
    it 'displays top 40 results from search' do
      VCR.use_cassette('movie_details') do
        visit movies_path

        expect(page).to have_content("Top 40 Movies")

        within "#top-40" do
          expect(page).to have_css("div", :count => 40)
        end

        within "#movie-id-436969" do
          expect(page).to have_content("The Suicide Squad")
          expect(page).to have_content("Vote Average: 8")
        end

        within "#movie-id-460465" do
          expect(page).to have_content("Mortal Kombat")
          expect(page).to have_content("Vote Average: 7.4")
        end
      end
    end
  end

  describe 'navigation' do
    it 'links to movie show page through movie title' do
      VCR.use_cassette('movie_details') do
        visit movies_path

        VCR.use_cassette('single_movie_details') do
          within "#movie-id-436969" do
            click_on "The Suicide Squad"
          end
        end

        expect(current_path).to eq(movie_path(436969))
      end
    end
  end
end

# [ ] As an authenticated user
# [ ] When I visit the movies page,
# [x] I should see the 40 results from my search,
# [ ] I should also see the "Find Top Rated Movies" button
# [ ] and the Find Movies form at the top of the page.

# [ ] Details: The results from the search should appear on this page,
# [ ] and there should only be a maximum of 40 results.
# [ ] The following details should be listed for each movie.

# [x] Title (As a Link to the Movie Details page)
# [x] Vote Average of the movie
