import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="brick-type"
export default class extends Controller {
  static targets = ["category", "sub_category", "size"]

  connect() {
    console.log(this.categoryTarget, this.sub_categoryTarget)
  }

  revealSub() {
    this.sub_categoryTarget.classList.remove("d-none")
  }

  revealSize() {
    this.sizeTarget.classList.remove("d-none")
  }
}
