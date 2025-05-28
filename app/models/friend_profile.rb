class FriendProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :interrests, dependent: :destroy
  has_one_attached :photo
  has_many :hobbies, through: :interrests, source: :hobbie
  validates :username, presence: true, uniqueness: true



  attr_accessor :hobbies_ids

end
