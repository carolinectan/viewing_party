require 'rails_helper'

RSpec.describe "new Party page" do
  describe 'features' do
    before :each do
      @user1 = User.create(email: 'ilovedogs@gmail.com', password: 'test')
      @user2 = User.create(email: 'dogsrule@gmail.com', password: 'test2')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      Friendship.create(user_id: @user1.id, friend_id: @user2.id)
    end

    it 'allows creation of new viewing party' do
      VCR.use_cassette('ss_movie_details') do
        visit movie_path(436969)

        click_on "Create a Viewing Party"
        expect(current_path).to eq(new_party_path)

        within("#new_party") do
          find(:css, "#party_attendees_#{@user2.id}").set(true)
          click_on "Create Party"
        end

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end
