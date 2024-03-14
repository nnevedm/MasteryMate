import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

static targets = ["hint"]

static values = {
  limit: 30
}

connect() {
  // console.log("hello");
}

countdown(event) {
  const numberOfCharacters = event.currentTarget.value.length;
  if (numberOfCharacters > this.limitValue) {
    this.hintTarget.innerHTML = `Number of character exceeded by ${numberOfCharacters - this.limitValue}`;
    this.hintTarget.classList.add("text-danger");
  } else if (numberOfCharacters > 0) {
    this.hintTarget.innerHTML = `${this.limitValue - numberOfCharacters} characters left`;
  } else {
    this.hintTarget.innerHTML = "";
  }
}
}
