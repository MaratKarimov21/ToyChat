class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    feach_chat
    @message = Message.new
  end

  def create
    feach_chat
    Message.create!(user: current_user, chat: @chat, content: params[:message][:content])
    redirect_to "/chats/#{@chat.id}/messages/new"
  end

  private

  def feach_chat
    @chat = Chat.find_by(id: params[:chat_id])
  end

end
