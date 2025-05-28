import { Controller } from "@hotwired/stimulus";
import  TomSelect  from "tom-select";
// Connects to data-controller="tom-select"
export default class extends Controller {
  static targets =["hobbies"]
  connect() {
   new TomSelect(this.element,{
      plugins: ['remove_button'],
      maxItems: 5
    })

  }
}
//   //private

//   #setInputValue(event) {
//   this.hobbiesTarget.value = event.result["hobby"]
// }

//   #clearInputValue() {
//   this.hobbiesTarget.value = ""
// }
// }
