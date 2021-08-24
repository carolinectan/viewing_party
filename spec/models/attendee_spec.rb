require 'rails_helper'

RSpec.describe Attendee, type: :model do
  # describe 'validations' do
  #   it { should validate_presence_of :}
  # end

  describe 'relationships' do
    it {should belong_to(:party)}
    it {should belong_to(:user)}
  end

  # describe 'instance methods' do
  # end
end