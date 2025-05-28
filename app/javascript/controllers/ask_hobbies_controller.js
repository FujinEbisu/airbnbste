import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ask-hobbies"
export default class extends Controller {
  connect() {
  }

  purpose(event) {
    fetch('https://api.api-ninjas.com/v1/hobbies', {
      method: "GET", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },

  })
    .then(response => response.json())
    .then((data) => {
      const hobbies = data.map(hobby => hobby.hobby).join(', ');
      const purpose = event.value;
      const selections = [];
      hobbies.forEach((hobbie) => {
        if (hobbie.startsWith(purpose)) {
          selections.push(hobbie);
        }
      });
    })
}

  ask(event) {
    const selected = []
    const select = event.value
    selected.push(select)
}
}
