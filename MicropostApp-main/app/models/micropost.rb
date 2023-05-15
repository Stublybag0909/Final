class Micropost < ApplicationRecord
  # microposts are for users
  belongs_to :user
  # Added validation for whether microposts are more than 140 chars long
  validates :content, presence: true, length: {maximum: 140}
end
