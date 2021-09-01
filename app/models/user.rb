class User < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :parties, dependent: :destroy
  has_many :parties, through: :attendees, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
end
