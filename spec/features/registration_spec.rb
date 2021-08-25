require 'rails_helper'

RSpec.describe 'user registration form' do
  before :each do
    visit root_path
  end

  it 'creates new user' do
    click_on 'Register'

    expect(current_path).to eq('/registration')

    email = 'ilovedogs@gmail.com'
    password = 'test'

    fill_in :email, with: email
    fill_in :password, with: password

    click_on 'Register'

    expect(page).to have_content("Welcome, #{username}!")
  end
end

# When a user visits the '/registration' path they should see a form to register.
# The form should include:
#
#  Email
#  Password
#  Password Confirmation
#  Register Button
# Once the user registers they should be logged in and redirected to the dashboard page
