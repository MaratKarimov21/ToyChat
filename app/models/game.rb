class Game < ApplicationRecord
  include GamesHelper

  SIGNS = ['X', 'O'].freeze

  WIN_STATES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  belongs_to :playerX, class_name: 'User'
  belongs_to :playerO, class_name: 'User'

  def opponent_of(me)
    me == playerX ? playerO : playerX
  end

  def sign_of(user)
    user == playerX ? 'X' : 'O'
  end

  def start
    puts SIGNS.sample
    self.update(turn_status: SIGNS.sample)
    self.broadcast_game_status()
  end

  def broadcast_game_status()
    cable_ready[DeskChannel].inner_html(
      selector: "#status",
      html: self.decorided_status()
    ).broadcast_to(self)
  end

  def decorided_status
    case self.turn_status
    when 'X', 'O'
      then "Player <span class='display-player player#{self.turn_status}'>#{self.turn_status}</span> turn"
    when 'X won'
      then "Player <span class='display-player playerX'>X</span> won"
    when 'O won'
      then "Player <span class='display-player playerO'>O</span> won"
    end
  end

  def opposite_sign(sign)
    sign == 'X' ? 'O' : 'X'
  end

  def check_win_state
    game_state = self.state

    WIN_STATES.each do |win_state|
      if game_state[win_state[0]] == game_state[win_state[1]] && game_state[win_state[0]] == game_state[win_state[2]] && game_state[win_state[0]] != ''
        return "#{game_state[win_state[0]]} won"
      end
    end

    return
  end
end
