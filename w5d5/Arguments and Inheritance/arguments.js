function sum1() {
  let sum = 0;
  for (let i = 0; i < arguments.length; i++){
    sum += arguments[i];
  }
  return sum;
}

// console.log(sum1(1,2,3));

function sum2(...nums){
  let sum = 0;
  nums.forEach ((num) => sum += num )
  return sum;
}

// nums.forEach ((num) => sum += num )
// nums.each { |num| sum += num }

// console.log(sum2(1,2,3));

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}


Function.prototype.myBind = function (context, ...args) {
  return (...args2) => { this.apply(context, args.concat(args2)); }
};

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true
