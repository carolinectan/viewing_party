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

    fill_in :user_email, with: email
    fill_in :user_password, with: password

    click_on 'Register'

    expect(page).to have_content("Welcome, #{email}!")
  end

  it 'redirects to dashboard page after user registers' do
    visit '/registration'

    email = 'ilovedogs@gmail.com'
    password = 'test'

    fill_in :user_email, with: email
    fill_in :user_password, with: password

    click_on 'Register'

    expect(current_path).to eq('/dashboard')
  end
end


# Once the user registers they should be logged in and redirected to the dashboard page
