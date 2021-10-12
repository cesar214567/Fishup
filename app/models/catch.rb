class Catch < ApplicationRecord
  has_many :catch_spots
  has_many :spots, through: :catch_spots
  validates :name, :description, :habitat, :scientific_name, :maximum_size, :minimum_size, presence: true
  has_many :bait_catches
  has_many :baits, through: :bait_catches
end
