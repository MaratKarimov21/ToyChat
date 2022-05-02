class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @current_page = 'Home'
  end

  def clicker
    @current_page = 'Clicker'
  end
end
