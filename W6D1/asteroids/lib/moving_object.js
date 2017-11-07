class MovingObject {
  constructor(pos, vel, radius, color) {
    this.pos = pos;
    this.vel = vel;
    this.radius = radius;
    this.color = color;
  }

  draw(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2 * Math.PI,
      false
    );
    ctx.fill();
  }

  move() {
    this.pos += this.vel;
  }
}

Function.prototype.inherits = function (ParentClass) {
  function Surrogate () {}
  Surrogate.prototype = ParentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};
