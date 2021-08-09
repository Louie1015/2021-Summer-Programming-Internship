boolean a =false;
void setup(){
  size(400,400);
  background(130);
  println(isBlueish (24,30,50));
  delay (5000);
  println(isBlueish (30,59,47));
}


boolean isBlueish (int r, int g, int b){
  if(b > r && b > g){
    background (r,g,b);
    println ("is blueish");
    return true;
  }else{
    background(r,g,b);
    println("is not blueish");
    return false;
  }
}