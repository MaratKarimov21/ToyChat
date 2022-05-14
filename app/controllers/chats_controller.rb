class ChatsController < ApplicationController
  #before_action :fetch_chat
  #before_action :authenticate
  before_action :authenticate_user!

  def index
    @current_page = 'Chats'
    @friends = current_user.friends
    @chat = fetch_chat
  end

  def show
    @chat = fetch_chat
  end

  private

  def fetch_chat
    @chat = Chat.find_by(id: params[:id]) || current_user.chats.first
  end

  def authenticate
    raise ActionController::RoutingError.new('Not Found') unless member?
  end

  def member?
    current_user == @chat.user || current_user == @chat.creator
  end
end
