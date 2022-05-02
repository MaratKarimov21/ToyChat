class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @current_page = 'Home'
  end

  def clicker
    @count = session[:count].to_i
    @current_page = 'Clicker'
  end
end
