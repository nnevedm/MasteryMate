import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {

  connect() {
  }

  spin() {
    this.element.innerHTML = "<i class='fa-solid fa-spinner fa-spin'></i>"
  }

}
