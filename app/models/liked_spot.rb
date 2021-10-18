class LikedSpot < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  scope :exists_by_user_and_spot, ->(user_id, spot_id) { where(user_id: user_id, spot_id: spot_id).uniq }
end
