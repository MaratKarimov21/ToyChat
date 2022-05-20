class GamesController < ApplicationController
  def show
    @game = Game.find_by(id: params[:id])
    @render_widgets = true
    session[:current_game_id] = @game.id
  end

  def create
    Game.create!(playerX_id: params[:user_id], playerO_id: params[:friend_id])
  end
end
