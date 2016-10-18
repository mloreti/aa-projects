function curriedSum(numArgs){
  const numbers = [];

  return function _curriedSum(num){
    numbers.push(num);

    if (numbers.length === numArgs){
      let sum = 0;
      numbers.forEach((num)=> { sum += num});
      return sum
    } else {
      return _curriedSum;
    }
  }
}
//
// const sum = curriedSum(4);
// console.log(sum(5)(10)(3)(10)); // => 56

Function.prototype.curry = function (numArgs) {
  const numbers = [];
  let context = this;
  return function _curriedSum(num){
    numbers.push(num);
    if (numbers.length === numArgs){
      return context.apply(context, numbers);
    } else {
      return _curriedSum;
    }
  }
}


function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
// console.log(f1);
