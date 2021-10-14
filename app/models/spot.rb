class Spot < ApplicationRecord
  has_many_attached :images
  has_many :catch_spots
  has_many :catches, through: :catch_spots
  has_many :voted_spots
  has_many :posts
  validates :name, :description, :longitude, :latitude, presence: true
  reverse_geocoded_by :latitude, :longitude, address: :loc
  scope :from_bait_id, ->(id) { distinct.joins(catch_spots: { catch: { bait_catches: :bait } }).where(baits: { id: id })}
  include PgSearch::Model
  pg_search_scope :general_search,
    against: [ :name, :loc ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
