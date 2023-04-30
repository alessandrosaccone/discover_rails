# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "script", to: "script.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js", preload: true
pin "script_login", to: "script_login.js"
