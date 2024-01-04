import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="brick-categories"
export default class extends Controller {
  static targets = ["category", "sub_category", "sub_category_wrapper", "size", "size_wrapper", "category_type", "category_type_wrapper"]

  connect() {
  }

  revealSub() {
    const category = this.categoryTarget.value;
    this.resetDropdown(this.sub_categoryTarget, "sub category");
    this.sub_category_wrapperTarget.classList.add("d-none");
    this.resetDropdown(this.sizeTarget, "size");
    this.size_wrapperTarget.classList.add("d-none");
    this.resetDropdown(this.category_typeTarget, "type");
    this.category_type_wrapperTarget.classList.add("d-none");
    const fieldLabel = "sub category";
    fetch(`/brick_categories/filter_sub_category?category=${category}`)
      .then(response => response.json())
      .then(sub_categories => this.updateDropdown(this.sub_categoryTarget, sub_categories, fieldLabel))
      .then(() => {
        const wrapper = this.sub_category_wrapperTarget;
        if (wrapper && wrapper.classList.contains ("d-none")) {
          wrapper.classList.remove("d-none")
        };
      });
  }

  revealSize() {
    const category = this.categoryTarget.value;
    const sub_category = this.sub_categoryTarget.value;
    this.resetDropdown(this.sizeTarget, "size");
    this.size_wrapperTarget.classList.add("d-none");
    this.resetDropdown(this.category_typeTarget, "type");
    this.category_type_wrapperTarget.classList.add("d-none");
    const fieldLabel = "size"
    fetch(`/brick_categories/filter_size?category=${category}&sub_category=${sub_category}`)
      .then(response => response.json())
      .then(sizes => this.updateDropdown(this.sizeTarget, sizes, fieldLabel))
      .then(() => {
        const wrapper = this.size_wrapperTarget;
        if (wrapper && wrapper.classList.contains ("d-none")) {
          wrapper.classList.remove("d-none")
        };
      });
  }

  revealType() {
    const category = this.categoryTarget.value;
    const sub_category = this.sub_categoryTarget.value;
    const size = this.sizeTarget.value;
    this.resetDropdown(this.category_typeTarget, "type");
    this.category_type_wrapperTarget.classList.add("d-none");
    const fieldLabel = "type"
    fetch(`/brick_categories/filter_category_type?category=${category}&sub_category=${sub_category}&size=${size}`)
      .then(response => response.json())
      .then(category_types => this.updateDropdown(this.category_typeTarget, category_types, fieldLabel))
      .then(() => {
        const wrapper = this.category_type_wrapperTarget;
        if (wrapper && wrapper.classList.contains ("d-none")) {
          wrapper.classList.remove("d-none")
        };
      });
  }


  updateDropdown(dropdown, options, fieldLabel) {
    dropdown.innerHTML = "";

    const promptOption = document.createElement('option');
    promptOption.text = `Select a ${fieldLabel}`;
    dropdown.appendChild(promptOption);

    options.forEach(option=> {
      const opt = document.createElement('option');
      opt.value = option;
      opt.text = option;
      dropdown.appendChild(opt);
    });
  }

  resetDropdown(dropdown, fieldLabel) {
    dropdown.innerHTML = "";

    const promptOption = document.createElement('option');
    promptOption.value = "";
    promptOption.text = `Select a ${fieldLabel}`;
    dropdown.appendChild(promptOption);
  }
}
