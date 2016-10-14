Array.prototype.myUniq = function(){
  let uniqs = [];
  for (let i = 0; i < this.length; i++){
    if (!uniqs.includes(this[i])) {
      uniqs.push(this[i]);
    }
  }
  return uniqs;
};

// let a = [1,2,3,4,5,6,3,1,3,1,1].myUniq();
// console.log(a);
//
// console.log(my_uniq([1,2,2,3,1]));

Array.prototype.twoSum = function() {
  let output = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        output.push([i, j]);
      }
    }
  }
  return output;
};
// let a = [-1, 0, 2, -2, 1].twoSum();
// console.log(a);

function myTranspose(arr) {
  const output = [];
  for (let i = 0; i < arr.length; i++) {
    const row = [];
    for (let j = 0; j < arr.length; j++) {
      row.push(arr[j][i]);
    }
    output.push(row);
  }
  return output;
}

let b = myTranspose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]);
// console.log(b);
