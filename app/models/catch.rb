class Catch < ApplicationRecord
  has_many :catch_spots
  has_many :spots, through: :catch_spots
  has_many :bait_catches
  has_many :baits, through: :bait_catches
  validates :name, :description, :habitat, :scientific_name, :maximum_size, :minimum_size, presence: true
  has_one_attached :image
  include PgSearch::Model
  pg_search_scope :general_search,
  against: [:name, :description, :scientific_name], associated_against: {
    spots:[:name, :loc],
    baits:[:name]
  }, using: {tsearch: {prefix: true}}
end
