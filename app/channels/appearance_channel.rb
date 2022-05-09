class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'appearance'
    current_user.appear(connection.server.connections.count)
  end
end
