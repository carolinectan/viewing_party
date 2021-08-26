require 'rails_helper'

RSpec.describe "Dashboard page" do
  describe "navigation" do
    it 'links to Discover page' do
      visit dashboard_path

      click_on "Discover Movies"
      expect(current_path).to eq(discover_path)
    end
  end

  describe 'features' do
    it 'displays greeting to authenticated user' do
      visit login_path

      user = User.create(email: 'ilovedogs@gmail.com', password: 'test')
      
      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_on 'Log In'

      expect(page).to have_content("Welcome, #{user.email}!")
    end

    xit 'displays friends of user' do
  
    end
  end
end