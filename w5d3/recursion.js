// iterative

function iterRange(start, end){
  let output = [];
  for(let i = start; i <= end; i++){
    output.push(i);
  }
  return output
}
// console.log(iterRange(4, 10));

function recRange (start, end) {
  if (start === end) { return [end] };
  return [start].concat(recRange(start+1, end));
}
// console.log(recRange(4, 10));

function exponent1 (base, exp) {
  if (exp === 1) {return base};
  return base * exponent1(base, exp - 1);
}
// console.log(exponent1(2, 3));


function exponent2(base, exp) {
  if (exp === 0) {return 1};
  if (exp === 1) {return base};
  if (exp % 2 == 0) {
    let rec = exponent2(base, (exp / 2));
    return rec * rec;
  } else {
    let squared = exponent2(base, ((exp - 1) / 2));
    return base * squared * squared;
  }
}
// console.log(exponent2(2, 3));
// b * (exp(b, (n - 1) / 2) ** 2)

function fib(n) {
  if (n === 1) {return [1]};
  if (n === 2) {return [1,1]};
  let prev = fib(n-1);
  return prev.concat(prev[prev.length-1] + prev[prev.length-2]);
}
// console.log(fib(5));


// bsearch

function bsearch(arr, target) {
  if(arr.length == 0) { return null };

  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid)
  let right = arr.slice(mid, arr.length)

  if (target === arr[mid]) { return mid }
  if (target < arr[mid]) {
    return (bsearch(left, target));
  } else {
    let rightSearch = bsearch(right, target);
    if (rightSearch === null){
      return null;
    } else {
      return mid + rightSearch;
    }
  }
}

// console.log(bsearch([2,3,4,5,6], 4));


function mergeSort(arr) {
  if (arr.length <= 1) {return arr}
  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid, arr.length);
  return merge(mergeSort(left), mergeSort(right));
}


function merge(left, right) {
  let sorted = [];
  while (left.length != 0 && right.length != 0) {
    if (left[0] > right[0]) {
      sorted.push(right.shift());
    } else {
      sorted.push(left.shift());
    }
  }

  return sorted.concat(left).concat(right);
}

//
//
// console.log(mergeSort([7,3,9,5,7,2]));


function subsets(arr) {
  if (arr.length === 0) { return [[]] }
  let prev = subsets(arr.slice(1))
  let subs = prev.map(sub_arr => [arr[0]].concat(sub_arr))
  return prev.concat(subs)
}


console.log(subsets([1,2,3]));
