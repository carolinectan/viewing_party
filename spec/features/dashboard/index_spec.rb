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

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{user.email}!")
    end

    context "Friends" do
      it 'displays friends of user' do
        visit dashboard_path

        within("#friends") do
          expect(page).to have_content("Friends")
        end
      end
    end

    context "Viewing Parties" do
      before :each do
        visit dashboard_path
      end

      it 'contains Viewing Party section' do
        expect(page).to have_content("Viewing Parties")
      end

      it 'displays viewing parties this user has created' do
        within("#my-parties") do
          expect(page).to have_content("My Parties")
          # link_to movie
          # date/time
          # You are the host
          # list of invited friends
        end
      end

      it 'displays viewing parties this user has been invited to' do
        within("#party-invites") do
          expect(page).to have_content("Viewing Party Invites")
          # link_to movie
          # date/time
          # Host
          # list of invited friends
        end
      end
    end
  end
end
