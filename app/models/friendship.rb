class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, uniqueness: {
    scope: :friend,
    message: 'You are already friends'
  }
end
