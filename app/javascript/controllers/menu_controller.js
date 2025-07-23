import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "items" ]

  initialize() {
    this.collapsed = true
  }

  toggle() {
    this.collapsed = !this.collapsed

    if (this.collapsed) {
      this.itemsTarget.classList.add("hidden")
    } else {
      this.itemsTarget.classList.remove("hidden")
    }
  }
}
