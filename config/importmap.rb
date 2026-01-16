# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "masonry-layout", preload: true # @4.2.2
pin "desandro-matches-selector" # @2.0.2
pin "ev-emitter" # @1.1.1
pin "fizzy-ui-utils" # @2.0.7
pin "get-size" # @2.0.3
pin "outlayer" # @2.1.1
pin_all_from "app/javascript/controllers", under: "controllers"

