import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["input", "form"]

  connect() {
    console.log("Search bar controller connected")
  }

  search(event) {
    console.log("Search input changed:", this.inputTarget.value)
  }
}
