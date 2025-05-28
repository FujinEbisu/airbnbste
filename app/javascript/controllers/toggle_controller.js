import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "hideable"]
  connect() {
    console.log(this.titleTargets)
  }

  book() {
    this.togglableElementTarget.classList.toggle("d-none");
  }

  toggleTargets(event) {
    if (event.currentTarget.innerText == "Go to my Bookings") {
      event.currentTarget.innerText = "Go to my Profiles"
    } else {
      event.currentTarget.innerText = "Go to my Bookings" 
    }
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    })
  }
}
