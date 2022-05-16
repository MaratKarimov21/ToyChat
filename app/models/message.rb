class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  after_create_commit -> { broadcast_update_to "chat_#{self.chat.id}", partial: "chats/chat_item", locals: { chat: self.chat }, target: 'chat' }
end
