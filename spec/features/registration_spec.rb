require 'rails_helper'

RSpec.describe 'user registration form' do
  before :each do
    visit root_path
  end

  it 'creates new user' do
    click_on 'Register'

    expect(current_path).to eq(users_path)

    email = 'ilovedogs@gmail.com'
    password = 'test'

    within "#register-user" do
      fill_in :user_email, with: email
      fill_in :user_password, with: password

      click_on 'Register'
    end
    
    expect(page).to have_content("Welcome, #{email}!")
  end

  it 'redirects to dashboard page after user registers' do
    visit users_path

    email = 'ilovedogs@gmail.com'
    password = 'test'

    within "#register-user" do
      fill_in :user_email, with: email
      fill_in :user_password, with: password

      click_on 'Register'
    end

    expect(current_path).to eq(dashboard_path)
  end

  # Add sad path test for if a user already exists, plus message.
end
