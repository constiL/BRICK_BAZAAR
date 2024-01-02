import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-brick"
export default class extends Controller {
  static targets = ["infos", "form"]

  connect() {

  }

  revealForm() {
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}