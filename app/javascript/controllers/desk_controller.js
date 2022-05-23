import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import CableReady from 'cable_ready'

export default class extends Controller {
  static values = { id: Number }

  connect() {
    this.application.consumer = createConsumer()
    this.channel = this.application.consumer.subscriptions.create(
      {
        channel: 'DeskChannel',
        id: this.idValue
      },
      {
        connected: this._connected.bind(this),
        disconnected: this._disconnected.bind(this),
        received: this._received.bind(this),
      }
    )
  }

  _connected() {
    console.log('Game controller conected')
  }

  _disconnected() {
    console.log('disconnected')
  }

  _received(data) {
    console.log(data.operations)
    if (data.cableReady) CableReady.perform(data.operations)
  }

  disconnect() {
    this.channel.unsubscribe()
  }
}
