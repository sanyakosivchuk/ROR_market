import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static target = ["menu"]

  connect() {
    console.log("connected")
    document.addEventListener("click", this.closeMenuOutside.bind(this));
  }
  
  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
  }

  closeMenuOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden");
    }
  }
}