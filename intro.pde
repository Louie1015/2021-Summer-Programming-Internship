/*
  name: lortiz
  date: 13 July 20221
  desc: Introduction Sketch
*/


int circlex;

//Runs once at start of program/sketch
void setup()
{
  size(800, 600);
  circlex = 0;
}


//Runs in loop until closses
void draw()
{
  //background(0);
  drawMovingCircle();
  
  
  //rect(200, 200, 200, 200);
  circlex = circlex + 1;
  println(circlex);
}

void keyPressed()
{
if(key == 'x')
{
  println("x pressed");
}
}

void drawMovingCircle()
{
  fill(0,255,0);
  ellipse(circlex, height/2, 100, 100);
  if(circlex > width)
 { 
circlex = 0;
}
}
