import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept"
export default class extends Controller {
  static targets = ["hide"]
  connect() {

  }

  yes() {
    this.hideTarget.value= true;
    this.element.submit()
    };
  no() {
    this.hideTarget.value= false;
    this.element.submit()
  }
}
