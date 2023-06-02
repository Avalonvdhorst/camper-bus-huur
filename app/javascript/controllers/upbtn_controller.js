import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upbtn"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    window.onscroll = this.#hideOrDisplayBtnOnScroll();
  }

  goToTop() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
  }

  #hideOrDisplayBtnOnScroll() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      console.log(document.body.scrollTop)
      console.log(document.documentElement.scrollTop)
      this.buttonTarget.classList.add("d-block")
      this.buttonTarget.classList.remove("d-none");
    } else {
      this.buttonTarget.classList.remove("d-block")
      this.buttonTarget.classList.add("d-none");
    }
  }
}
