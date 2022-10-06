# Pin npm packages by running ./bin/importmap
pin_all_from "app/javascript/custom", under: "custom"
pin "application", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
