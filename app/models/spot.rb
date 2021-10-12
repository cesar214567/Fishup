class Spot < ApplicationRecord
  has_many_attached :images
  has_many :catch_spots
  has_many :voted_spots
  has_many :posts
  validates :name, :description, :longitude, :latitude, presence: true
  # reverse_geocoded_by :latitude, :longitude, address: :loc
end
