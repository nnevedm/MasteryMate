import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="steps"
export default class extends Controller {
  static targets = ["button1", "button2", "button3", "button4", "render1", "render2", "render3", "render4"]

  display1(event) {
    this.render1Target.classList.remove("d-none")
    this.render2Target.classList.add("d-none")
    this.render3Target.classList.add("d-none")
    this.render4Target.classList.add("d-none")

    this.button1Target.classList.add("active-step")
    this.button2Target.classList.remove("active-step")
    this.button3Target.classList.remove("active-step")
    this.button4Target.classList.remove("active-step")
  }

  display2(event) {
    this.render1Target.classList.add("d-none")
    this.render2Target.classList.remove("d-none")
    this.render3Target.classList.add("d-none")
    this.render4Target.classList.add("d-none")

    this.button1Target.classList.remove("active-step")
    this.button2Target.classList.add("active-step")
    this.button3Target.classList.remove("active-step")
    this.button4Target.classList.remove("active-step")

  }

  display3(event) {
    this.render1Target.classList.add("d-none")
    this.render2Target.classList.add("d-none")
    this.render3Target.classList.remove("d-none")
    this.render4Target.classList.add("d-none")

    this.button1Target.classList.remove("active-step")
    this.button2Target.classList.remove("active-step")
    this.button3Target.classList.add("active-step")
    this.button4Target.classList.remove("active-step")
  }

  display4(event) {
    this.render1Target.classList.add("d-none")
    this.render2Target.classList.add("d-none")
    this.render3Target.classList.add("d-none")
    this.render4Target.classList.remove("d-none")

    this.button1Target.classList.remove("active-step")
    this.button2Target.classList.remove("active-step")
    this.button3Target.classList.remove("active-step")
    this.button4Target.classList.add("active-step")
  }
}
