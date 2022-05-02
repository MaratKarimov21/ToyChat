class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # validates :user_id, uniqueness: {
  #   scope: :friend_id,
  #   message: 'You are already friends'
  # }

  # validates :friend_id, uniqueness: {
  #   scope: :user_id,
  #   message: 'You are already friends'
  # }
end
