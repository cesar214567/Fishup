class Bait < ApplicationRecord
  #validates :cost, :name, :description, presence: true
  has_many :bait_catches
  has_many :catches, through: :bait_catches
  #scope :spots, ->{ self.catch.spots }
end
