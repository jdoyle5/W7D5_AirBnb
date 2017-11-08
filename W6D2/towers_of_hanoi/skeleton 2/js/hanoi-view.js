const View = function (game, $el) {

  this.game = game;
  this.$el = $el;

  this.originIdx = null;

  this.setupTowers();
  this.render();

  this.$el.on(
    "click",
    "ul",
    this.clickTower.bind(this)
  );

};

View.prototype.render = function () {
  const $towers = this.$el.find("ul");
  $towers.removeClass();

  if (this.originIdx !== null) {
    $towers.eq(this.originIdx).addClass("selected");
  }

  this.game.towers.forEach( (disks, towerIdx) => {
    const $disks = $towers.eq(towerIdx).children();
    $disks.removeClass();

    disks.forEach( (diskWidth, diskIdx) => {

      $disks.eq(-1 * (diskIdx + 1)).addClass(`disk-${diskWidth}`);
    });
  });
};

View.prototype.clickTower = function (event) {
  const clickedIdx = $(event.currentTarget).index();

  if (this.originIdx === null) {
    this.originIdx = clickedIdx;
  } else {
    if (!this.game.move(this.originIdx, clickedIdx)) {
      alert("Invalid Move! Try again.");
    }

    this.originIdx = null;
  }

  this.render();

  if (this.game.isWon()) {
    this.$el.off("click");
    this.$el.addClass("game-over");
    alert("You completed Towers of Annoy");
  }
};

View.prototype.setupTowers = function () {

  for (let i = 0; i < 3; i++) {
    const $ul = $('<ul>');
    this.$el.append($ul);
    $ul.addClass("group");
    for (let j = 0; j < 3; j++) {
      let $li = $("<li>");
      $li.data("pos", [i, j]);
      $ul.append($li);
    }
  }
};

module.exports = View;
