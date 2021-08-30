require 'rails_helper'

RSpec.describe 'movies show page' do
  it 'has a button to create a viewing party' do
    VCR.use_cassette('movie_reviews') do
      visit movie_path(436969)

      expect(page).to have_button("Create a Viewing Party")
    end
  end

  describe 'reviews section' do
    it 'displays the total count of reviews' do
      VCR.use_cassette('movie_reviews') do

        visit movie_path(436969)
        save_and_open_page
        expect(page).to have_content("The Suicide Squad's Details")
        expect(page).to have_content("Total Reviews: 4")

        within "#review-id-61048d3d688cd0007f215a28" do
          expect(page).to have_content("Author: Peter89Spencer")
          expect(page).to have_content("Name:")
          expect(page).to have_content("Rating: 8.0")
          expect(page).to have_content("stayed true to the hype of the anti-hero teams in DC")
        end
      end
    end
  end
end

# As an authenticated user,
# When I visit the movie's details page,
# I should see
#
#  Button to create a viewing party
# Details This button should take the authenticated user to the new event page
#
# And I should see the following information about the movie:
#
#  Movie Title
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genere(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)


#  Count of total reviews
#  Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API
