class Bait < ApplicationRecord
  has_many :bait_catches
  has_many :catches, through: :bait_catches
  scope :from_spot_id, ->(id) { distinct.joins(bait_catches: { catch: { catch_spots: :spot } }).where(spot: { id: id })}
  validates :cost, :name, :description, presence: true
  has_one_attached :image
  include PgSearch::Model
  pg_search_scope :general_search,
  against: [:name, :description],
  associated_against: {
    catches: [:name]
  }, using: {
    tsearch: {prefix: true}
  }
end
