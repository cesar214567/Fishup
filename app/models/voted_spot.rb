class VotedSpot < ApplicationRecord
  belongs_to :spot
  belongs_to :user
end
