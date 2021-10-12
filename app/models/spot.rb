class Spot < ApplicationRecord
  has_many :posts
  has_many :catches, through: :catch_spots

end
