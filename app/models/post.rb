class Post < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  belongs_to :catch
  validates :title, :body, presence: true
  has_one_attached :image
end
