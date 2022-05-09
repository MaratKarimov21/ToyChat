class User < ApplicationRecord
  include CableReady::Broadcaster

  devise :database_authenticatable, :registerable, :authentication_keys => [:username]

  has_and_belongs_to_many :friends,
    class_name: 'User',
    join_table: 'friendships',
    association_foreign_key: 'friend_id',
    after_add: :create_complement_friendship,
    after_remove: :remove_complement_friendship

  has_many :received_invitations, class_name: 'Invitation', foreign_key: 'receiver_id', inverse_of: :receiver
  has_many :sended_invitations, class_name: 'Invitation', foreign_key: 'sender_id', inverse_of: :sender

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

  def appear(count)
    cable_ready["appearance"].inner_html(
      selector: '#appearance',
      html: 'Appearanse: ' + count.to_s
    )
    cable_ready.broadcast
  end

  private

  def create_complement_friendship(friend)
    friend.friends << self  unless friend.friends.include?(self)
  end

  def remove_complement_friendship(friend)
    friend.friends.delete(self)
  end
end
