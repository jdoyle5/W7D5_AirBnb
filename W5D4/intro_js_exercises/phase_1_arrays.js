Array.prototype.uniq = function () {
  let uniq = [];
  this.forEach(function(el) {
    if (uniq.includes(el) === false) {
      uniq.push(el);
    }
  });
  return uniq;
};


Array.prototype.twoSum = function () {
  let sum = [];
  const that = this;
  this.forEach((el1, idx1) => {
    // debugger
    this.forEach(function(el2, idx2) {
      if (idx1 >= idx2) { return; }
      if (el1 + el2 === 0) {
        sum.push([idx1, idx2]);
      }
    });
  });
  return sum;
};


Array.prototype.transpose = function () {
  // let new_arr = [];
  const columns = this.length;
  const rows = this[0].length;

  let new_arr = new Array(rows);
  for (var i=0; i< rows; i++) {
    new_arr[i] = new Array(columns);
  }

  this.forEach((arr, idx1) => {
    arr.forEach((el, idx2) => {
      new_arr[idx2][idx1] = el ;
    });
  });
  return new_arr;
};
