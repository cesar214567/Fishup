class Catch < ApplicationRecord
  has_many :catch_spots
  has_many :spots, through: :catch_spots
  has_many :bait_catches
  has_many :baits, through: :bait_catches
end
