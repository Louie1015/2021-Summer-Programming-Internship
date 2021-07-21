/*
  name: lortiz
  date: 13 July 20221
  desc: SplitMover
*/

int circlea;
int circleb;
int circlec;
int circled;

void setup()
{
  size(800, 800);
  circlea = 0;
  circleb = 400;
  circlec = 800;
  circled = 800;
}

void draw()
{
  drawMovingCirclea();
  drawMovingCircleb();
  drawMovingCirclec();
  drawMovingCircled();

  
  circlea = circlea + 1;
  circleb = circleb + 1;
  circlec = circlec - 1;
  circled = circled - 1;
}

void drawMovingCirclea()
{
  fill(0,255,0);
  ellipse(50, circlea, 50, 50);
  if(circlea > height/2)
  {
circlea = 100;
}
}


void drawMovingCircleb()
{
  fill(255,0,0);
  ellipse(circleb, 50, 50, 50);
  if(circleb > width)
  {
circleb = 400;
}
}

void drawMovingCirclec()
{
  fill(0,255,255);
  ellipse(circlec, 750, 50, 50);
  if(circlec < height/2)
  {
circlec = 700;
}
}

void drawMovingCircled()
{
  fill(0,0,255);
  ellipse(50, circled, 50, 50);
  if(circled < height/2)
  {
circled = 750;
}
}
