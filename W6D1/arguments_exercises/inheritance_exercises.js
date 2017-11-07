// Function.prototype.inherits = function (parentClass) {
//   function Surrogate () {}
//   Surrogate.prototype = parentClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };
//
function MovingObject (name) {
  this.name = name;
}

function Ship (name) {
  MovingObject.call(this, name);

}
// Ship.inherits(MovingObject);

function Asteroid (name) {
  // MovingObject.call(this, name);
}
// Asteroid.inherits(MovingObject);
//


Ship.prototype = Object.create(MovingObject.prototype);
Ship.prototype.constructor = Ship;

Asteroid.prototype = Object.create(MovingObject.prototype);
Asteroid.prototype.constructor = Asteroid;

let ship1 = new Ship ('nice ship');
let asteroid1 = new Asteroid ('nice asteroid');
console.log(ship1.name);
console.log(asteroid1.name);
