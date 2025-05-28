import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["dates"]
  connect() {
   this.calendar =  flatpickr(this.element,{
    mode: "range",
    minDate: "today",
    dateFormat: "Y-m-d",
    disable: [
        ],
    })};
  }

