class Booking < ApplicationRecord
  belongs_to :friend_profile
  belongs_to :user

  attr_accessor :range_date, :choose


  validates :start_date, presence: true
  validates :end_date, presence: true
end
