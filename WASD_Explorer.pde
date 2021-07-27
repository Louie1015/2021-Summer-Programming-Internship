/*
  name: lortiz
  date: 27 July 2021
  desc: Guider
*/

int sky;
int skycolorr;
int skycolorg;
int skycolorb;
int land;
int stars;
int moon;
int sun;
int clouds;
int clouda;
int cloudb;
int cloudaa;
int cloudbb;
int cloudaaa;
int cloudbbb;
int bob;
int boba;

void setup ()
{
  size(1200, 350);
  
  boba = 50;
  
  clouda = 150;
  cloudb = 200;
  
  cloudaa = 500;
  cloudbb = 550;
  
  cloudaaa = 900;
  cloudbbb = 950;
}

void draw ()
{
  drawsky();
  drawland();
  drawstars();
  drawmoon();
  drawsun();
  drawclouds();
  drawbob();
  
  clouda = clouda + 1;
  cloudb = cloudb + 1;
  
  cloudaa = cloudaa + 1;
  cloudbb = cloudbb + 1;
  
  cloudaaa = cloudaaa + 1;
  cloudbbb = cloudbbb + 1;
}

void drawsky ()
{
  fill(skycolorr,skycolorg,skycolorb);
  rect(0,0,1200,300);
  
  if(boba < 400)
  {
    skycolorr = 0;
    skycolorg = 150;
    skycolorb = 255;
  }
  
  if(boba > 400 && boba < 800)
  {
    skycolorr = 0;
    skycolorg = 0;
    skycolorb = 255;
  }
  
  if(boba > 800)
  {
    skycolorr = 0;
    skycolorg = 0;
    skycolorb = 0;
  }
  
}

void drawland ()
{
  fill(0,255,50);
  rect(0,300,1200,50); 
}

void drawstars ()
{}

void drawmoon () 
{}

void drawsun ()
{
  fill(255,255,0);
  ellipse(1200,0,200,200);
}

void drawclouds ()
{
  fill(255,255,255);
  stroke(255,255,255);
  
  ellipse(clouda,100,100,100);
  ellipse(clouda,150,200,100);
  ellipse(cloudb,100,50,50);
 
  ellipse(cloudaa,100,100,100);
  ellipse(cloudaa,150,200,100);
  ellipse(cloudbb,100,50,50);
  
  ellipse(cloudaaa,100,100,100);
  ellipse(cloudaaa,150,200,100);
  ellipse(cloudbbb,100,50,50);
  if(clouda > width + 50)
  {
    clouda = -200;
    cloudb = -150;
    cloudaa = -200;
    cloudbb = -150;
    cloudaaa = -200;
    cloudbbb = -150;
  }
  
  if(cloudb > width + 50)
  {
    clouda = -200;
    cloudb = -150;
    cloudaa = -200;
    cloudbb = -150;
    cloudaaa = -200;
    cloudbbb = -150;
  }
}

void drawbob ()
{
  fill(222,184,135);
  ellipse(boba, 300, 75, 75);
  if(boba < mouseX)
  {
     boba = boba + 2;
  }
    
  if(boba > mouseX)
  {
     boba = boba - 2;
  }
}
