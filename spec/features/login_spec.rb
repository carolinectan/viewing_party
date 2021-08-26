require 'rails_helper'

RSpec.describe 'logging in' do
  before :each do
    @user = User.create(email: 'ilovedogs@gmail.com', password: 'test')
    require "pry"; binding.pry
  end

  it 'can log in with valid credentials' do
    visit root_path

    click_on 'Log In'

    expect(current_path).to eq(login_path)

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

  it "cannot log in with bad credentials" do
    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
