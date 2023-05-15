class Category < ApplicationRecord

  # establishes existence and restricts length of name 
  validates :name, presence: true, length: {maximum: 25, minimum: 3}, uniqueness: true

end
