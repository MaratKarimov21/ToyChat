class DeskChannel < ApplicationCable::Channel
  def subscribed
    stream_or_reject_for Game.find(params[:id])
  end
end
