require 'rails_helper'

RSpec.describe 'welcome page' do
  before :each do
    visit "/"
  end

  it 'has a welcome message' do
    expect(page).to have_content('Welcome to Viewing Party!')
  end

  it 'has a welcome description' do
    expect(page).to have_content('Where you view movies with your friends')
  end

  it 'has a button to login' do
    expect(page).to have_button('Log In')
  end

  it 'has a link to registration' do
    expect(page).to have_link('Register')
  end
end

# When a user visits the root path they should be on the welcome page which includes:
#
#  Welcome message
#  Brief description of the application
#  Button to Log in
#  Link to Registration
# Details: Implement basic auth in the application allowing a user to log in with an email and password. The password should be stored in the database using bcrypt.
