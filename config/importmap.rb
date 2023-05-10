# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "script", to: "script.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js", preload: true
pin "script_login", to: "script_login.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.1/lib/assets/compiled/rails-ujs.js", preload: true
pin "swiper",to: "https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js", preload:true
pin "script_guide",to:"script_guide.js"


