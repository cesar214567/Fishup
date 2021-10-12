class Bait < ApplicationRecord
  #validates :cost, :name, :description, presence: true
  has_many :bait_catches
  has_many :catches, through: :bait_catches
  scope :from_post_id, ->(id) { distinct.joins(bait_catches: { catch: { catch_spots: :spot } }).where(spot: { id: id })}
end
