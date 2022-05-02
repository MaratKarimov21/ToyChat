class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User', inverse_of: :sended_invitations
  belongs_to :receiver, class_name: 'User', inverse_of: :received_invitations

  validates :sender_id, uniqueness: {
    scope: :receiver_id,
    message: 'Invitation already sended'
  }

  # validates :receiver_id, uniqueness: {
  #   scope: :sender_id,
  #   message: 'Invitation already sended'
  # }

  def accept
    update!(confirmed: true)
    sender.friends << receiver
  end
end
