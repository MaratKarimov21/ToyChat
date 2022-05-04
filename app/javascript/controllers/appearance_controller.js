import ApplicationController from './application_controller.js'
import { createConsumer } from "@rails/actioncable"

export default class extends ApplicationController {
  connect() {
    console.log('hi')
    this.subscription = createConsumer().subscriptions.create(
      {
        channel: "AppearanceChannel",
        id: this.data.get("id"),
      },
      {
        connected: this._connected.bind(this),
        disconnected: this._disconnected.bind(this),
        received: this._received.bind(this),
      }
    );
  }

  _connected() {}

  _disconnected() {}

  _received(data) {
    const element = this.statusTarget
    element.innerHTML = data
  }
}
