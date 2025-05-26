class Booking < ApplicationRecord
  belongs_to :friend_profile
  belongs_to :user
end
