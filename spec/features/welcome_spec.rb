require 'rails_helper'

RSpec.describe 'welcome page' do
  before :each do
    visit "/"
  end

  describe 'welcome page message and description' do
    it 'has a welcome message' do
      expect(page).to have_content('Welcome to Viewing Party!')
    end

    it 'has a welcome description' do
      expect(page).to have_content('Where you view movies with your friends')
    end
  end

  describe 'login' do
    it 'has a button to login' do
      expect(page).to have_button('Log In')
    end
  end

  describe 'registration' do
    it 'has a link to registration' do
      expect(page).to have_link('Register')
    end
  end
end

# Details: Implement basic auth in the application allowing a user to log in with an email and password. The password should be stored in the database using bcrypt.
