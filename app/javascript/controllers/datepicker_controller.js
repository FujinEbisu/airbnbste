import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["dates"]
  static values = {
    dates: Array
  }

  connect() {
    console.log(this.datesValue);
    
   flatpickr(this.element,{
    mode: "range",
    minDate: "today",
    dateFormat: "Y-m-d",
    disable:
      this.datesValue,
    })};
  }
