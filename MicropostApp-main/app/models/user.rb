class User < ApplicationRecord
  # Regex check for valid email
  VALID_EMAIL_REGEX = /[a-zA-Z]+.+@.+\.[a-zA-Z]+/

  validates :email, format: {with: VALID_EMAIL_REGEX}
  
  # restricts length of username
  validates :name, presence: true, length: {maximum: 50}

  # more than one micropost can exist per user: destroy all microposts if user destroyed
  has_many :microposts, dependent: :destroy



  # Follows a user.
  def follow(other_user)
    following << other_user unless self == other_user
  end
  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end
  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  
  

  # Tells rails that the user following another user is now identified with a foreign key
  has_many:follower_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :follower_relationships, source: :followed
  # Same thing but for followed
  has_many:followed_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :followed_relationships, source: :follower
end
