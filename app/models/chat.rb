class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: 'User'

  has_many :messages

  def opponent_of(me)
    me == user ? creator : user
  end

  def last_message
    messages.order(created_at: :desc).first
  end
end
