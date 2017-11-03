Array.prototype.bubbleSort = function () {
  let arr = this;
  let sorted = false;
  while (sorted === false) {
    sorted = true;
    arr.forEach((el, idx) => {
      if (el > arr[idx + 1]) {
        let that = arr[idx];
        arr[idx] = arr[(idx + 1)];
        arr[(idx + 1)] = that;
        sorted = false;
      }
    });
  }
  return arr;
};

String.prototype.substrings = function () {
  let newArr = [];
  let splitString = this.split("");
  splitString.forEach((el1, idx1) => {
    splitString.forEach((el2, idx2) => {
      if (idx2 <= idx1) { return; }
      newArr.push(this.substring(idx1, idx2));
    });
  });
  return newArr;
};
