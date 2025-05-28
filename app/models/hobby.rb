class Hobby < ApplicationRecord
  has_many :interrests, dependent: :destroy
end
