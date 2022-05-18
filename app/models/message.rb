class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  after_create_commit -> {
    broadcast_append_to "chat_#{self.chat.id}",
      partial: "chats/message",
      locals: { message: self, user: self.user },
      target: 'messages'
  }
end
