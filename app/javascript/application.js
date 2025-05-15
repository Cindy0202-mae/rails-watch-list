// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "bootstrap"
import "@popperjs/core"

import Typed from "typed.js";

document.addEventListener("turbo:load", function () {
  const typedText = document.querySelector("#typed-text");
  if (typedText) {
    new Typed("#typed-text", {
      strings: [
        "Plan your movie nights effortlessly.",
        "Discover and manage your favorite movies.",
        "Start organizing your watchlist today!",
      ],
      typeSpeed: 50,
      backSpeed: 20,
      loop: true,
      showCursor: true,
      cursorChar: "🪄",
    });
  }
});
// console.log("Bootstrap and Popper.js loaded")
