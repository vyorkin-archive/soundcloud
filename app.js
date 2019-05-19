function main() {
  require("./output/Main").main()
}

if (module.hot) {
  module.hot.accept(function() {
    document.body.innerHTML = ""
    main()
  })
}

main()
