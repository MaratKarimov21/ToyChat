import ApplicationController from './application_controller.js'

export default class extends ApplicationController {
  turn(id) {
    this.stimulate('Game#make_turn', id.target.id)
  }

  makeTurnError(e) {
    this.animation(e.id)
  }

  animation(id) {
    let x = document.getElementById(id)
    x.style.backgroundColor = "red"
    x.style.transition = "0.25s"
    setTimeout(() => {
      x.style.backgroundColor = "#12181B"
    }, 251)
  }
}
