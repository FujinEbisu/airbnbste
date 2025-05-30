import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["input", "form"]

  connect() {
    console.log("Search bar controller connected")
  }

  search(event) {
    // This method is triggered on input, you could add debouncing here
    // For now, let's just log to see it's working
    console.log("Search input changed:", this.inputTarget.value)
  }

  clear(event) {
    event.preventDefault()
    this.inputTarget.value = ""
    // Redirect to root path to clear search results
    window.location.href = "/"
  }

  submit(event) {
    // This handles form submission
    // The form will naturally submit to root_path with the query parameter
    console.log("Search form submitted")
  }
}
