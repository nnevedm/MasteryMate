import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["cards", "field"]

  connect() {
    console.log("hey hey")
  }

  display(event) {
    console.log("click!")
    console.log(this.fieldTarget)
    console.log(this.cardsTarget)
  }
}
