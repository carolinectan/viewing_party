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

        expect(page).to have_content("The Suicide Squad")
        expect(page).to have_content("PAW Patrol: The Movie")
        expect(page).to have_content("Jungle Cruise")
        expect(page).to have_content("Eggs Run")
        expect(page).to have_content("Black Widow")
        expect(page).to have_content("Narco Sub")
        expect(page).to have_content("Space Jam: A New Legacy")
        expect(page).to have_content("Free Guy")
        expect(page).to have_content("F9")
        expect(page).to have_content("El mesero")
        expect(page).to have_content("Sweet Girl")
        expect(page).to have_content("Beckett")
        expect(page).to have_content("Infinite")
        expect(page).to have_content("The Boss Baby: Family Business")
        expect(page).to have_content("Luca")
        expect(page).to have_content("The Tomorrow War")
        expect(page).to have_content("The Loud House Movie")
        expect(page).to have_content("Black Island")
        expect(page).to have_content("The Last Mercenary")
        expect(page).to have_content("Don't Breathe 2")
        expect(page).to have_content("Jolt")
        expect(page).to have_content("The Forever Purge")
        expect(page).to have_content("Bartkowiak")
        expect(page).to have_content("Cruella")
        expect(page).to have_content("Dreamcatcher")
        expect(page).to have_content("Spider-Man: Far From Home")
        expect(page).to have_content("Vivo")
        expect(page).to have_content("Wrath of Man")
        expect(page).to have_content("Dynasty Warriors")
        expect(page).to have_content("Reminiscence")
        expect(page).to have_content("Dinosaur Hotel")
        expect(page).to have_content("Demon Slayer -Kimetsu no Yaiba- The Movie: Mugen Train")
        expect(page).to have_content("Godzilla vs. Kong")
        expect(page).to have_content("A Quiet Place Part II")
        expect(page).to have_content("Insensate")
        expect(page).to have_content("The Exorcism of Carmen Farias")
        expect(page).to have_content("Rurouni Kenshin: The Beginning")
        expect(page).to have_content("Mortal Kombat")
        expect(page).to have_content("The Conjuring: The Devil Made Me Do It")
        expect(page).to have_content("Spider-Man: No Way Home")
      end
    end
  end

  describe 'navigation' do
    it 'links to movie show page through movie title' do
      VCR.use_cassette('movie_details') do
        visit movies_path

        within "#movie-id-436969" do
          click_on "The Suicide Squad"
        end

        expect(current_path).to eq(movie_path(436969))
      end
    end
  end
end

# As an authenticated user
# When I visit the movies page,
# I should see the 40 results from my search,
# I should also see the "Find Top Rated Movies" button
# and the Find Movies form at the top of the page.

# Details: The results from the search should appear on this page,
# and there should only be a maximum of 40 results.
# The following details should be listed for each movie.

# Title (As a Link to the Movie Details page)
# Vote Average of the movie
