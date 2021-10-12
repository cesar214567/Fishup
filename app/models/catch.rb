class Catch < ApplicationRecord
  has_many :catch_spots
  has_many :spots, through: :catch_spots
  validates :name, :description, :habitat, :scientific_name, :maximum_size, :minimum_size, presence: true
end
