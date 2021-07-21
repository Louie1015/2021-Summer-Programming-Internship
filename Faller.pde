/*
  name: lortiz
  date: 13 July 2021
  desc: SplitMover
*/

int circlea;
int squarea;
int rectanglea;
float circlecolora;
float squarecolora;
int rectanglecolora;
float circlecolorb;
float squarecolorb;
int rectanglecolorb;

void setup ()
{
  size(600, 600);
  circlea = -50;
  squarea = -100;
  rectanglea = -100;
  
  circlecolora = 0;
  squarecolora = 0;
  rectanglecolora = 0;
  circlecolorb = 255;
  squarecolorb = 255;
  rectanglecolorb = 255;
}

void draw ()
{
  drawbackgrounds();
  drawcircle();
  drawsquare();
  drawrectangle();
  
  circlea = circlea + 1;
  squarea = squarea + 3;
  rectanglea = rectanglea + 6;
  
  circlecolora = circlecolora + 0.4;
  circlecolorb = circlecolorb - 0.4;
  squarecolora = squarecolora + 1.2;
  squarecolorb = squarecolorb - 1.2;
  rectanglecolora = rectanglecolora + 2;
  rectanglecolorb = rectanglecolorb - 2;
  
}

void drawbackgrounds()
{
  fill(0,255,0);
  rect(0,0,200,599);
  
  fill(255,0,0);
  rect(200,0,200,599);
  
  fill(0,0,255);
  rect(400,0,200,599);
}


void drawcircle()
{
 stroke(0,255,0);
 fill(circlecolorb,circlecolora,0);
 ellipse(100, circlea, 100, 100);
 if(circlea > height + 50)
  {
circlea = -50;
circlecolorb = 255;
circlecolora = 0;
}
}

void drawsquare()
{
  stroke(255,0,0);
  fill(squarecolora,0,squarecolorb);
  rect(250, squarea, 100, 100);
  if(squarea > height + 50)
  {
squarea = -100;
squarecolorb = 255;
squarecolora = 0;
}
}

void drawrectangle()
{
  stroke(0,0,255);
  fill(rectanglecolorb,rectanglecolorb,rectanglecolora);
  rect(450, rectanglea, 100, 200);
  if(rectanglea > height + 100)
  {
rectanglea = -200;
rectanglecolorb = 255;
rectanglecolora = 0;
}
}
