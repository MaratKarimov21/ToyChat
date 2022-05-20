import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.focus_last()
  }

  focus_last() {
    this.element.querySelector('li:last-child').scrollIntoView()
  }
}
