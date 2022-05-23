import ApplicationController from './application_controller.js'
import { createConsumer } from "@rails/actioncable"
import CableReady from 'cable_ready'

export default class extends ApplicationController {
  start() {
    this.stimulate('Game#start')
  }

  make_turn() {
    //cell.target.stimulate('Game#make_turn', cell.target.id)
    console.log(this)
    this.stimulate('Game#make_turn', this.element.id)
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
