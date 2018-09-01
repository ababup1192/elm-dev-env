require('./main.scss');

const Elm = require('./Main.elm');
const mountNode = document.getElementById('main');

const app = Elm.Elm.Main.init({
  node: document.getElementById('main')
});
