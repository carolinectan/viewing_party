require 'rails_helper'

RSpec.describe "Discover index page" do
  describe 'features' do
    it 'contains button to discover top 40 movies' do
      user = User.create(email: 'ilovedogs@gmail.com', password: 'test1')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit discover_path

      expect(page).to have_button('Discover Top 40 Movies')
    end

    it 'discover button visits movies_path' do
      user = User.create(email: 'ilovedogs@gmail.com', password: 'test1')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette('movie_details') do
        visit discover_path

        click_button 'Discover Top 40 Movies'

        expect(current_path).to eq(movies_path)
      end
    end
  end
end
