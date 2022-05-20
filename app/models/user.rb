class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :authentication_keys => [:username]

  has_and_belongs_to_many :friends,
    class_name: 'User',
    join_table: 'friendships',
    association_foreign_key: 'friend_id',
    after_add: :create_complement_friendship,
    after_remove: :remove_complement_friendship

  has_many :received_invitations, class_name: 'Invitation', foreign_key: 'receiver_id', inverse_of: :receiver
  has_many :sended_invitations, class_name: 'Invitation', foreign_key: 'sender_id', inverse_of: :sender

  has_many :created_chats, class_name: 'Chat', foreign_key: 'creator_id', inverse_of: :creator
  has_many :involved_chats, class_name: 'Chat', foreign_key: 'user_id', inverse_of: :user

  has_many :x_games, class_name: 'Game', foreign_key: 'playerX_id', inverse_of: :playerX
  has_many :o_games, class_name: 'Game', foreign_key: 'playerO_id', inverse_of: :playerO

  validates :username, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.username = auth.info.username
    user.password = Devise.friendly_token[0,20]
    end
  end

  def send_invitation_to(user)
    Invitation.create!(sender: self, receiver: user)
  end

  def chats
    created_chats + involved_chats
  end

  def pending_games
    x_games + o_games
  end

  def chat_with(friend)
    created_chats.where(user: friend).first || involved_chats.where(creator: friend).first
  end

  private

  def create_complement_friendship(friend)
    friend.friends << self  unless friend.friends.include?(self)
  end

  def remove_complement_friendship(friend)
    friend.friends.delete(self)
  end
end
