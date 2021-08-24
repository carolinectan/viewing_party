class User < ApplicationRecord
  has_many :attendees
  has_many :parties, through: :attendees
end
