class VerifyCatchSpot < ApplicationRecord
  belongs_to :catch_spot
  belongs_to :user
  scope :exists_by_user_and_catch_spot, ->(user_id, catch_spot_id) { where(user_id: user_id, catch_spot_id: catch_spot_id).uniq }
  validates :catch_spot_id, uniqueness: { scope: :user_id }
  scope :count_by_catch_spot_id, ->(catch_spot_id) { where(catch_spot_id: catch_spot_id).count}

end
