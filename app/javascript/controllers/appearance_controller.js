import ApplicationController from './application_controller.js'
import { createConsumer } from "@rails/actioncable"
import CableReady from 'cable_ready'


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

  _connected() {
    console.log('Appearance controller conected')
  }

  _disconnected() {}

  _received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
  }
}
