// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { carouselRUN } from "./carousel.js"

window.addEventListener('load', function() {
  carouselRUN();
}, false);
