class FriendProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings, :reviews
end
