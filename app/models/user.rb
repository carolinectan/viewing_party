class User < ApplicationRecord
  has_many :attendees
  has_many :parties, through: :attendees
  has_many :friendships
  has_many :friends, through: :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
end
