Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};


Array.prototype.myMap = function (callback) {
  let newArr = [];
  // this.myEach(callback);
  this.myEach(function (el) {
    newArr.push(callback(el));
  });
  return newArr;
};

Array.prototype.myReduce = function (callback, initialValue) {
  let accum;
  if (initialValue) {
    accum = initialValue;
  } else {
    accum = this.shift();
  }

  this.myEach(function (el) {
    accum = callback(accum, el);
  });

  return accum;
};
