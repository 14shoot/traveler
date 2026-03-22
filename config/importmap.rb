# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
<<<<<<< HEAD
pin "bootstrap", to :"bootstrap.min.js", preload: true
=======
pin "bootstrap", to: "bootstrap.min.js", preload: true
>>>>>>> 1f3aa13 (11)
pin "@popperjs/core", to: "popper.js", preload: true