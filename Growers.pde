/*
  name: lortiz
  date: 13 July 2021
  desc: Introduction Sketch
*/

int squarep;
int dimensionadjuster;
int squarem;
int lineh;
int linev;

void setup()
{
  size(800,800);
  background(0,0);
  dimensionadjuster = 1;
  
}

void draw()
{
  drawGrowingRect();
  drawGrowingLineh();
  drawGrowingLinev();
  squarep = squarep + dimensionadjuster;
  
}


void drawGrowingRect()
{
  println(squarep);
  rectMode(CENTER);
  fill(255,0,0);
      //println(dimensionadjuster);
      
  rect(400,400,squarep,squarep);
  if(squarep > 400)
  {
    dimensionadjuster = -1;
  }
  if(squarep < 1)
  {
    dimensionadjuster = 1;
  }
}

void drawGrowingLineh()
{
  line(200,400,600,400);
}

void drawGrowingLinev()
{
  line(400,200,400,600);
}
