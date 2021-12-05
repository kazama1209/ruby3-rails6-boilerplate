const { environment } = require("@rails/webpacker");

const webpack = require("webpack");
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery/src/jquery",
    jQuery: "jquery/src/jquery",
    Popper: [
      "popper.js",
      "default",
    ] /* 多くの記事で 「$ yarn add popper.js」と書いてあるが、実際は「$ yarn add @popperjs/core」じゃないと動かない */,
  })
);

module.exports = environment;
