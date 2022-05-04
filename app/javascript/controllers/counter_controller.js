import ApplicationController from './application_controller.js'

export default class extends ApplicationController {
  increment(event) {
    event.preventDefault()
    this.stimulate('Counter#increment', 1)
  }

  disconnect() {
    this.stimulate('Counter#save') // Error disconnecting controller
  }
}
