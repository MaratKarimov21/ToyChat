class GameReflex < ApplicationReflex
  #include GamesHelper

  def make_turn(cell_id)
    game = Game.find(session[:current_game_id])
    user = User.find(session[:current_user_id])

    puts game.turn_status
    puts '==============='


    if game.state[cell_id.to_i] == '' && game.turn_status == game.sign_of(user)
      new_state = game.state
      new_state[cell_id.to_i] = game.sign_of(user)
      game.update(state: new_state)

      cable_ready[DeskChannel].morph(
        selector: "#game_#{game.id}",
        html: render(partial: "games/game", locals: { game: game, user: user })
      ).broadcast_to(game)

      game.update(turn_status: game.opposite_sign(game.turn_status))
      game.broadcast_game_status()

      if game.check_win_state
        game.update(turn_status: game.check_win_state)
        game.broadcast_game_status
      end

    else
      raise StandardError
    end
  end

  def start
    game = Game.find(session[:current_game_id])
    game.update(state: ["", "", "", "", "", "", "", "", ""])
    game.start
  end
end
