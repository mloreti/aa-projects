



function test () {
  console.log(this);
  function test1 () {
    console.log(this);
  } ()
  () => { console.log(this);}
}
test();
