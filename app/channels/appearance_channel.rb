class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    puts 'subscribed'
  end
end
