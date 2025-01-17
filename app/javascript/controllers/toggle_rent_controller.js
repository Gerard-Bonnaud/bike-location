import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-rent"
export default class extends Controller {

  static targets = ["togglableElement"]

  connect() {
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
