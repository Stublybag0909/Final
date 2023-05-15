class Relationship < ApplicationRecord
  # Associates the Relationship to the User model twice
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # Adds validation for follower_id and followed_id
end
