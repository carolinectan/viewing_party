class Attendee < ApplicationRecord
  belongs_to :viewing_party
  belongs_to :user
end
