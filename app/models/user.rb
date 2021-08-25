class User < ApplicationRecord
  has_many :attendees
  has_many :parties, through: :attendees

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true
end
