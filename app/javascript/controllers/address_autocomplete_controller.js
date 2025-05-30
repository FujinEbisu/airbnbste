import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  // Connects to the controller
  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  // Disconnects from the controller
  disconnect() {
    this.geocoder.onRemove()
  }

  // Sets the input value
  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }
  
  // Clears the input value
  #clearInputValue() {
    this.addressTarget.value = ""
  }
}