class VerifyCatchSpot < ApplicationRecord
  belongs_to :catch_spot
  belongs_to :user
  validates :catch_spot_id, uniqueness: { scope: :user_id }
end
