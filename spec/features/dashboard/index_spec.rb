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

      # expect(current_path).to eq(dashboard_path)
      # this test currently passes though it doesn't test the message on the dashboard page
      # consider refactoring to use a view conditional like if user.save, then display x
      expect(page).to have_content("Welcome, #{user.email}!")
    end

    context "Friends" do
      xit 'displays friends of user' do
        visit dashboard_path

        within("#friends") do
          expect(page).to have_field(friend_search)
        end
      end
    end

    context "Viewing Parties" do
      xit 'displays viewing parties this user has created' do
        within("#my-parties") do
          # link_to movie
          # date/time
          # You are the host
          # list of invited friends
        end
      end

      xit 'displays viewing parties this user has been invited to' do
        within("#party-invites") do
          # link_to movie
          # date/time
          # You are the host
          # list of invited friends
        end
      end
    end
  end
end
