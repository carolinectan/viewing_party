require 'rails_helper'

RSpec.describe 'movies show page' do
  before :each do

    visit "/"
  end

  it '' do

  end
end

# As an authenticated user,
# When I visit the movie's detail page,
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
