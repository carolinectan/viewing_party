require 'rails_helper'

RSpec.describe 'Dashboard page' do
  describe 'navigation' do
    it 'links to Discover page' do
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
      it 'displays friends of user' do
        visit dashboard_path

        within '#friends' do
          expect(page).to have_content('Friends')
        end
      end

      xit "displays a text field to enter a friend's email and a button to add friend" do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        # session user id - application controller

        visit dashboard_path

        within '#friends' do
          expect(page).to have_content('You currently have no friends')

          fill_in "Friend's Email:", with: 'dogsrule@email.com'

          click_on 'Add Friend'
        end

        expect(current_path).to eq(discover_path)

        within '#friends' do
          expect(page).to have_content('dogsrule@email.com')
        end
      end
    end
# As an authenticated user,
# Scenarios:
#
# If I have not added any friends there should be a message. "You currently have no friends".
#
# If I have added friends, I should see a list of all my friends.
#
# Details: Users should be able to add a friend by their email address, as long as, the friend is a user of our application and exists in our database.
#
# Example:
# Bugs Bunny and Lola Bunny are users of our application, but Daffy Duck is not.
#
# When Bugs Bunny enters lola_bunny@gmail.com to add friend it will be successful and Lola should show up as Bugs Bunny's friend.
# When Bugs Bunny enters daffy_duck@gmail.com to add friend it should give an error message that the user does not exist.
# Tips: You'll want to research self-referential has_many through. Here is a good starting point to understand the concept. You will probably need to do more googling but that's part of the fun ;)
#
# Write a happy path test
# Write a sad path test

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
