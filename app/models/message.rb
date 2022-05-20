class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  after_create_commit -> {
    broadcast_update_to "chat_#{self.chat.id}_#{self.chat.user.id}",
      partial: "chats/chat_item",
      locals: { chat: self.chat, user: self.chat.user },
      target: 'chat'

    broadcast_update_to "chat_#{self.chat.id}_#{self.chat.creator.id}",
      partial: "chats/chat_item",
      locals: { chat: self.chat, user: self.chat.creator },
      target: 'chat'
  }
end
