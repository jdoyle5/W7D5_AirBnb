let sum1 = function (...args) {

  Array.prototype.forEach.call(
    arguments,
    (el) => {
      accum += parseInt(el);
    }
  );

  let arrayedArgs = Array.from(arguments);
  console.log(arrayedArgs);
  let accum = 0;
  arrayedArgs.forEach((el) => {
    accum += parseInt(el);
  });
  return accum;
};

let sum2 = function (...args) {
  // console.log(this.name);
  // let arrayedArgs = Array.from(arguments);
  // console.log(arrayedArgs);
  let accum = 0;
  args.forEach((el) => {
    accum += parseInt(el);
  });
  return accum;
};

// sum2.apply(dog, [arg1, arg2])
// sum2.call(dog, arg1, arg2)
// dog.sum2(arg1, arg2)
//


//
// let curry = function(callback) {
//   return function (arg1) {
//     return function(arg2) {
//       return callback(arg1, arg2);
//     };
//   };
// };

Function.prototype.myBind = function (ctx) {
  return () => this.apply(ctx);
};

Function.prototype.myBind = function (ctx) {
  let arrayArgs = Array.from(arguments);
  arrayArgs.shift();
  let func = this;
  return function () {
    let innnerArrayArgs = Array.from(arguments);
    func.apply(ctx, arrayArgs.concat(innnerArrayArgs));
  };
};
//
// const callback = sum2.myBind(dog, 2, 3, 4);
//
// callback(5)
//
// let another = function (...args) {
//   return sum2(args);
// };

Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
};
//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");


function curriedSum (numArgs) {
  let numbers = [];
  const _curriedSum = (number) => {
    numbers.push(number);
    if (numbers.length === numArgs) {
      let accum = 0;
      for (var i = 0; i < numbers.length; i++) {
        accum += numbers[i];
      }
      return accum;
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
}

const sum = curriedSum(4);
sum(5)(30)(20)(1);

Function.prototype.curry = function (numArgs) {
  let numbers = [];
  const _curriedFunct = (arg) => {
    numbers.push(arg);
    if (numbers.length === numArgs) {
      return this.apply(this, numbers);
    } else {
      return _curriedFunct;
    }
  };
  return _curriedFunct;
};

Function.prototype.curry = function (numArgs) {
  let numbers = [];
  const _curriedFunct = (arg) => {
    numbers.push(arg);
    if (numbers.length === numArgs) {
      return this.call(this, ...numbers);
    } else {
      return _curriedFunct;
    }
  };
  return _curriedFunct;
};


let sum3 = function (arg1, arg2, arg3) {
  return arg1 + arg2 + arg3;
};

const test = sum3.curry(3);
console.log(test(3)(4)(3));
