class Booking < ApplicationRecord
  belongs_to :friend_profile
  belongs_to :user

  attr_accessor :range_date
end
