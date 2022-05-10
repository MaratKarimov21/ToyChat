class AppearanceChannel < ApplicationCable::Channel
  include AppearanceHelper

  def subscribed
    stream_from 'appearance'
    user_appear(current_user.id)
    broadcast_counter
  end

  def unsubscribed
    user_disappear(current_user.id)
    broadcast_counter
  end
end
