import { Controller } from "@hotwired/stimulus";

// init swal


export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
