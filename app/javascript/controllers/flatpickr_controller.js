import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startdatum", "einddatum", "geboortedatum", "geboortedatumtwee" ]

  connect() {
    flatpickr(this.startdatumTarget, {})
    flatpickr(this.einddatumTarget, {})
    flatpickr(this.geboortedatumTarget, {})
    flatpickr(this.geboortedatumtweeTarget, {})
  }
}
