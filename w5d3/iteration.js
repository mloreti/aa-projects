//bubble sort

function bub(arr) {
  var sorted = true;

  while (sorted) {
    sorted = false;
    for (let i = 0; i < arr.length - 1; i++){
      if (arr[i] > arr[i + 1]) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        sorted = true;
      }
    }
  }

  return arr;
}

// let a = bub([3,2,1,6,1]);
// console.log(a);

function substrings(string) {
  let output = [];
  for (let i = 0; i < string.length; i++) {
    for (let j = i+1; j <= string.length; j++) {
      let word = string.slice(i,j);
      if (!output.includes(word)) {
        output.push(word)
      }
    }
  }
  return output;
}

name = "cat";
console.log(substrings(name));
