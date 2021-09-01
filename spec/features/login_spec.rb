require 'rails_helper'

RSpec.describe 'logging in' do
  describe 'happy path' do
    it 'can log in with valid credentials' do
      @user = User.create(email: 'ilovedogs@gmail.com', password: 'test')

      visit root_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_on 'Log In'

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Welcome, #{@user.email}!")
      expect(page).to_not have_link('Log In')
      expect(page).to_not have_link('Register')
      expect(page).to have_link('Log Out')

      click_link 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_link('Log In')
      expect(page).to have_link('Register')
      expect(page).to_not have_link('Log Out')
    end
  end

  describe 'sad path' do
    it 'cannot log in with bad credentials' do
      @user = User.create(email: 'ilovedogs@gmail.com', password: 'test')

      visit root_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: @user.email
      fill_in :password, with: 'incorrect password'

      click_on 'Log In'

      expect(current_path).to eq(login_path)

      expect(page).to have_content('Sorry, your credentials were bad. Try again.')
    end
  end
end
