module GamesHelper
  include CableReady::Broadcaster

  def broadcast_game_status(game)
    cable_ready[DeskChannel].inner_html(
      selector: "#status",
      html: "Player <span class='display-player player#{game.turn_status}'>#{game.turn_status}</span> turn"
    ).broadcast_to(game)
  end

  def opposite_sign(sign)
    sign == 'X' ? 'O' : 'X'
  end
end
