class Post < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  belongs_to :catch
end
