class Catch < ApplicationRecord
  has_many :catch_spots
  has_many :spots, through: :catch_spots
end
