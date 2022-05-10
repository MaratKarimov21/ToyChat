module AppearanceHelper
  include CableReady::Broadcaster

  def user_appear(id)
    REDIS.sadd('online', id)
  end

  def user_disappear
    REDIS.srem('online', id)
  end

  def online_count
    REDIS.smembers('online').count
  end

  def broadcast_counter
    cable_ready["appearance"].inner_html(
      selector: '#appearance',
      html: online_count.to_s
    )
    cable_ready.broadcast
  end
end
