class ChatsController < ApplicationController
  before_action :fetch_chat
  before_action :authenticate_user!

  def index
    @current_page = 'Chats'
    @friends = current_user.friends
  end

  def show
  end

  private

  def fetch_chat
    @chat = Chat.find_by(id: params[:id])
  end

  def authenticate
    raise ActionController::RoutingError.new('Not Found') unless member?
  end

  def member?
    current_user == @chat.user || current_user == @chat.creator
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
