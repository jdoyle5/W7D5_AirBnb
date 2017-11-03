function range (start, end) {
  let newArr = [];
  if (start === end) { return [end]; }
  // debugger
  newArr.push(start);
  return newArr.concat(range(start + 1, end));
}

function sumRec (arr) {
  if (arr.length === 1) { return arr[0]; }
  let accum = arr[0];

  return accum + sumRec(arr.slice(1, arr.length));
}

function exponent (base, exp) {
  if (exp === 1) {
    return base;
  }

  return base * exponent(base, exp - 1);
}

function fibonacci(n) {
  let newArr = [1,1];
  if (n===2) {
    return [1,1];
  }
  let sum = newArr[n-1] + newArr[n-2];
  newArr = newArr.push(sum);
  return newArr.concat(fibonacci(n-1));
}
