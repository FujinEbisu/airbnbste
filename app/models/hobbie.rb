class Hobbie < ApplicationRecord
  has_many :interrests, dependent: :destroy
end
