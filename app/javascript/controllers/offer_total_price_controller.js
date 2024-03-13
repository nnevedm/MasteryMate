import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-total-price"
export default class extends Controller {
  static values = { price: Number }
  static targets = ["numberOfHour", "extraCosts", "reduction", "totalPrice"]

  connect() {
    // console.log(this.totalPriceTarget)
    // console.log(this.priceTarget)
  }

  updateFields() {
    const totalPricePerHour = this.numberOfHourTarget.value * this.priceValue

    this.totalPriceTarget.innerText = totalPricePerHour + Number(this.extraCostsTarget.value) - Number(this.reductionTarget.value)
  }
}
