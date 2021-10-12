class BaitCatch < ApplicationRecord
  belongs_to :catch
  belongs_to :bait
  validates :catch_id, uniqueness: { scope: :bait_id }
end
