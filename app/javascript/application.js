// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import swal from 'sweetalert'
import { initSweetalert } from './init_sweet_alert'

// init swal

document.addEventListener("turbo:load", function() {
  // console.log("Hello from Turbo!");
  initSweetalert();
  });
