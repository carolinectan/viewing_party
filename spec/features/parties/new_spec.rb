require 'rails_helper'

RSpec.describe "new Party page" do
  describe 'features' do
    it 'allows creation of new viewing party' do
      VCR.use_cassette('single_movie_details') do
        visit movie_path(436969)
  
        click_on "Create a Viewing Party"
        expect(current_path).to eq(new_party_path)

        within("#new_party") do
          click_on "Create Party"
        end
        
        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end