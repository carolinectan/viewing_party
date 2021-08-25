require 'rails_helper'

RSpec.describe 'logging in' do
  before :each do
    @user = User.create(email: 'ilovedogs@gmail.com', password_digest: 'test')

    visit root_path
  end

  it 'can log in with valid credentials' do
    click_button 'Log In'

    expect(current_path).to eq(login_path)

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button 'Log In'

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{@user.email}!")
  end
end
