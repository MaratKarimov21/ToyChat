class Game < ApplicationRecord
  WIN_STATES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  belongs_to :playerX, class_name: 'User'
  belongs_to :playerO, class_name: 'User'

  def opponent_of(me)
    me == playerX ? playerO : playerX
  end

  def sign_of(user)
    user == playerX ? 'X' : 'O'
  end

  def check_win_state
    game_state = self.state

    WIN_STATES.each do |win_state|
      if game_state[win_state[0]] == game_state[win_state[1]] && game_state[win_state[0]] == game_state[win_state[2]]
        return "#{game_state[win_state[0]]} won"
      end
    end
  end
end
