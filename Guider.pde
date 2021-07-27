/*
  name: lortiz
  date: 27 July 2021
  desc: Guider
*/

int circlea;
int circlecolora;
int circlecolorb;
int lineh;
int background;

void setup ()
{
  size(600, 600);
  circlea = 300;
}

void draw ()
{
  drawbackground();
  drawcircle();
  drawlineh();
}

void drawbackground ()
{
  fill(0,0,255);
  rect(0,0,600,600);
}

void drawcircle ()
{
  stroke(0,0,255);
  fill(circlecolorb,circlecolora,0);
  ellipse(circlea, 300, 75, 75);
  if(circlea < mouseX)
  {
     circlea = circlea + 5;
  }
    
  if(circlea > mouseX)
  {
     circlea = circlea - 5;
  }
  
  if(mouseY > 300)
  {
    circlecolora = 255;
    circlecolorb = 255;
  }
  
  if(mouseY < 300)
  {
    circlecolora = 255;
    circlecolorb = 0;
  }
}

void drawlineh ()
{
  stroke(0);
  line(0,300,600,300);
}
