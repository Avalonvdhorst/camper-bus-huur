import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.modalTarget.classList.remove("d-none")
    this.modalTarget.classList.add("dark-backdrop")
  }

  close() {
    this.modalTarget.classList.add("d-none")
  }
}
