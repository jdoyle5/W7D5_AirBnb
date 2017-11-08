const View = require('./ttt-view.js');
const Game = require('./game.js');

$( () => {
  let $ttt = $(".ttt");
  // console.log($ttt);
  let game  = new Game();
  new View( game, $ttt);
});
