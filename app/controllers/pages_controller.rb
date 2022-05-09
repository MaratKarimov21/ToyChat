class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    session[:current_user_id] = current_user.id
    @current_page = 'Home'
  end

  def clicker
    @count = session[:count].to_i
    @current_page = 'Clicker'
  end
end
