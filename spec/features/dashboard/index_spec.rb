require 'rails_helper'

RSpec.describe 'Dashboard page' do
  describe 'navigation' do
    it 'links to Discover page' do
      user = User.create(email: 'ilovedogs@gmail.com', password: 'test1')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_on 'Discover Movies'

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

    describe 'Friends' do
      it 'displays a friends section for an authenticated user' do
        user = User.create(email: 'ilovedogs@gmail.com', password: 'test1')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path

        within '#friends' do
          expect(page).to have_content('Friends')
        end
      end

      it "displays a text field to enter a friend's email and a button to add friend for an authenticated user" do
        user1 = User.create(email: 'ilovedogs@gmail.com', password: 'test1')
        user2 = User.create(email: 'dogsrule@gmail.com', password: 'test2')
        user3 = User.create(email: 'ilovecats@gmail.com', password: 'test3')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

        visit dashboard_path

        within '#friends' do
          expect(page).to have_content('You currently have no friends')

          fill_in :email, with: 'dogsrule@gmail.com'

          click_on 'Add Friend'
        end

        expect(current_path).to eq(dashboard_path)

        within '#friends' do
          expect(page).to have_content('dogsrule@gmail.com')
        end

        within '#friends' do
          expect(page).to_not have_content('You currently have no friends')

          fill_in :email, with: 'ilovecats@gmail.com'

          click_on 'Add Friend'
        end

        expect(current_path).to eq(dashboard_path)

        within '#friends' do
          expect(page).to have_content('dogsrule@gmail.com')
          expect(page).to have_content('ilovecats@gmail.com')
        end
      end

      it "displays an error message if an authenticated user tries to add a friend that doesn't exist in the database" do
        user = User.create(email: 'ilovedogs@gmail.com', password: 'test1')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path

        within '#friends' do
          expect(page).to have_content('You currently have no friends')

          fill_in :email, with: 'birdsarecool@gmail.com'

          click_on 'Add Friend'
        end

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('That user does not exist. Please try again.')

        within '#friends' do
          expect(page).to_not have_content('birdsarecool@gmail.com')
        end
      end

      it 'redirects unauthenticated user to login page' do
        visit dashboard_path

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Sorry, you are not allowed to access this page. Please click the link below to log in.')
        expect(page).to have_link('Log In')
      end
    end

    context 'Viewing Parties' do
      before :each do
        user = User.create(email: 'ilovedogs@gmail.com', password: 'test1')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path
      end

      it 'contains Viewing Party section' do
        expect(page).to have_content('Viewing Parties')
      end

      it 'displays viewing parties this user has created' do
        within('#my-parties') do
          expect(page).to have_content('My Parties')
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
