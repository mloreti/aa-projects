const Cat = function (name, owner) {
  this.name = name;
  this.owner = owner;
  // this.cuteStatement = function (){
  //   return `${name} loves ${owner}`
  // }
}


micah.prototype.cuteStatement = function(){
  return `${name} loves ${owner}`
}

let micah = new Cat("Micah", "Jeff");
console.log(micah.cuteStatement());
