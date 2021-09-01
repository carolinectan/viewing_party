class Party < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees

  belongs_to :user
end
