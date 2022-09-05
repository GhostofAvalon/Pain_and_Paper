import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {

  static targets = ["form1", "form2", "form3", "form4", "form5", "counter", "description1",
                    "description2", "description3", "description4", "description5"]

  hide1() {
    this.form1Target.setAttribute("hidden", "true")
    const newCount = parseInt(this.counterTarget.innerHTML, 10) - 1
    this.counterTarget.innerHTML = newCount
  }

  hide2() {
    this.form2Target.setAttribute("hidden", "true")
    const newCount = parseInt(this.counterTarget.innerHTML, 10) - 1
    this.counterTarget.innerHTML = newCount
  }

  hide3() {
    this.form3Target.setAttribute("hidden", "true")
    const newCount = parseInt(this.counterTarget.innerHTML, 10) - 1
    this.counterTarget.innerHTML = newCount
  }

  hide4() {
    this.form4Target.setAttribute("hidden", "true")
    const newCount = parseInt(this.counterTarget.innerHTML, 10) - 1
    this.counterTarget.innerHTML = newCount
  }

  hide5() {
    this.form5Target.setAttribute("hidden", "true")
    const newCount = parseInt(this.counterTarget.innerHTML, 10) - 1
    this.counterTarget.innerHTML = newCount
  }

  display1() {
    this.description1Target.removeAttribute("hidden")
  }

  display2() {
    this.description2Target.removeAttribute("hidden")
  }

  display3() {
    this.description3Target.removeAttribute("hidden")
  }

  display4() {
    this.description4Target.removeAttribute("hidden")
  }

  display5() {
    this.description5Target.removeAttribute("hidden")
  }
}
