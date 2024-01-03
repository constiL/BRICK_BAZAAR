import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="brick-type"
export default class extends Controller {
  static targets = ["category", "sub_category", "size"]

  connect() {
    console.log(this.categoryTarget, this.sub_categoryTarget)
  }

  revealSub(event) {
    const category = this.categoryTarget.value;
    fetch(`/brick_types/filter_sub_category?category=${category}`)
      .then(response => response.json())
      .then(subCategories => this.updateDropdown(this.subCategoryTarget, subCategories))
      .then(() => this.sub_categoryTarget.closest('.d-none').classList.remove('d-none'));
  }
  this.sub_categoryTarget.classList.remove("d-none")
  revealSize() {
    this.sizeTarget.classList.remove("d-none")
  }
}
