import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.querySelector('li:last-child').scrollIntoView()
  }
}
