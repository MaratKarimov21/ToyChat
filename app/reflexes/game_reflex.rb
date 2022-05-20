class GameReflex < ApplicationReflex
  def make_turn(cell_id)
    @game = Game.find(session[:current_game_id])
    #throw StandardError
    if @game.state[cell_id.to_i] == ''
      new_state = @game.state
      new_state[cell_id.to_i] = 'O'
      @game.update(state: new_state)
      # cable_ready[HelensChannel].morph(
      #   selector: dom_id(self),
      #   html: render(self)
      # ).broadcast_to(self)
    else
      throw StandardError
    end
  end
end
