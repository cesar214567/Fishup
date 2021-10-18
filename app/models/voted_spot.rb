class VotedSpot < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  validates :spot_id, uniqueness: { scope: :user_id }
  scope :count_by_spot_id, ->(spot_id) { where(spot_id: spot_id).count }
  scope :exists_by_user_and_spot, ->(user_id, spot_id) { where(user_id: user_id, spot_id: spot_id).uniq }

end
