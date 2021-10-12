class CatchSpot < ApplicationRecord
  belongs_to :spot
  belongs_to :catch
  validates :spot_id, uniqueness: { scope: :catch_id }
end
