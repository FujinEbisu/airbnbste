class FriendProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :username, presence: true, uniqueness: true

  validates :interest, presence: true

  INTEREST_OPTIONS = ["sports_and_outdoors", "education", "competition", "Art collecting"].freeze
end
