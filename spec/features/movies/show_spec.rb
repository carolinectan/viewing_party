require 'rails_helper'

RSpec.describe 'movies show page' do
  it 'displays movie details' do
    VCR.use_cassette('single_movie_details') do
      visit movie_path(436969)
      expect(page).to have_content("The Suicide Squad's Details")
      expect(page).to have_content('Runtime: 132 minutes')
      expect(page).to have_content('Vote Average: 8.0')
      expect(page).to have_content('Genres: Action, Adventure, Fantasy, Comedy')
      expect(page).to have_content('Summary: Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.')
    end
  end

  it 'has a button to create a viewing party' do
    VCR.use_cassette('movie_reviews') do
      visit movie_path(436969)

      expect(page).to have_button('Create a Viewing Party')
    end
  end

  describe 'reviews section' do
    it 'displays the total count of reviews' do
      VCR.use_cassette('movie_reviews') do
        visit movie_path(436969)

        expect(page).to have_content('Total Reviews: 4')

        within '#review-id-61048d3d688cd0007f215a28' do
          expect(page).to have_content('Peter89Spencer')
          expect(page).to have_content('Rating: 8.0')
          expect(page).to have_content('stayed true to the hype of the anti-hero teams in DC')
        end
      end
    end
  end

  describe 'cast section' do
    it 'displays cast of movie' do
      VCR.use_cassette('single_movie_cast_details') do
        visit movie_path(436969)

        expect(page).to have_content('Margot Robbie as Harleen Quinzel / Harley Quinn')
        expect(page).to have_content('Michael Rooker as Brian Durlin / Savant')
      end
    end
  end
end

# As an authenticated user,
# When I visit the movie's details page,
# I should see
#
# Button to create a viewing party
# Details This button should take the authenticated user to the new event page
#
# List the first 10 cast members (characters&actress/actors)
