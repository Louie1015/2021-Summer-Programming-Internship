/*
name: lortiz
date: 8/9/2021
program: BiggerNumber
*/

void setup(){
println(biggerNumber(10,45));
println(biggerNumber(-10, 0));
println(biggerNumber(200, -5));
println(biggerNumber(-10, -233));
}

int biggerNumber(int a, int b){
  if (a>b){
    return a;
  }else{
    return b;
  }
}