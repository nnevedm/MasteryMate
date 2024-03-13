import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-total-price"
export default class extends Controller {
  static targets = ["numberOfHour", "extraCosts", "reduction", "totalPrice", "price"]
  connect() {
    console.log(this.numberOfHourTarget)
    console.log(this.extraCostsTarget)
    console.log(this.reductionTarget)
    console.log(this.totalPriceTarget)
    console.log(this.priceTarget)
  }

  updateFields() {
    const totalPricePerHour = this.numberOfHourTarget.innerText * this.priceTarget.innerText

    this.totalPriceTarget.innerText = totalPricePerHour + this.extraCostsTarget.innerText - this.reductionTarget.innerText
  }
}
