// myEach
Array.prototype.myEach = function(callback){
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

function printer(el){
  console.log(el);
}
// [1,2,3].myEach(printer);

// myMap

Array.prototype.myMap = function (callback){
  let output = [];
  this.myEach( el => {
    output.push(callback(el));
  });
  return output;
}

// let c = [1,2,3].myMap(doubler);
// console.log(c);

// def my_map(prc)
//   output = []
//   self.each { |x| output << prc.call(x) }
// end

// myInject

Array.prototype.myInject = function (callback, accum = 0) {
  let sum = accum;
  this.myEach( el => { sum += callback(el); })
  return sum;
};

let doubler = el => {return el * 2};

const a = [1,2,3,4,5,6].myInject(doubler);
console.log(a);
