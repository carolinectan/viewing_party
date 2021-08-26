require 'rails_helper'

RSpec.describe "Dashboard page" do
  before :each do
    visit dashboard_path
  end

  describe "navigation" do
    it 'links to Discover page' do
      click_on "Discover Movies"
      expect(current_path).to eq(discover_path)
    end
  end
end