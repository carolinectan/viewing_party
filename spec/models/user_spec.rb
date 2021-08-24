require 'rails_helper'

RSpec.describe User, type: :model do
  # describe 'validations' do
  #   it { should validate_presence_of :}
  # end

  describe 'relationships' do
    it {should have_many(:attendees)}
    it {should have_many(:parties).through(:attendees)}
  end

  # describe 'instance methods' do
  # end
end