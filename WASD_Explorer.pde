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
int bobb;

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
    
    fill(255,255,255);
    ellipse(10,240,5,5);
    ellipse(20,250,5,5);
    ellipse(30,150,5,5);
    ellipse(40,100,5,5);
    ellipse(50,210,5,5);
    ellipse(60,275,5,5);
    ellipse(70,20,5,5);
    ellipse(80,45,5,5);
    ellipse(90,20,5,5);
    ellipse(100,68,5,5);
    ellipse(110,170,5,5);
    ellipse(120,120,5,5);
    ellipse(130,35,5,5);
    ellipse(140,169,5,5);
    ellipse(150,266,5,5);
    ellipse(160,278,5,5);
    ellipse(170,124,5,5);
    ellipse(180,22,5,5);
    ellipse(190,55,5,5);
    ellipse(200,34,5,5);
    ellipse(210,78,5,5);
    ellipse(220,55,5,5);
    ellipse(230,33,5,5);
    ellipse(240,230,5,5);
    ellipse(300,246,5,5);
    ellipse(310,275,5,5);
    ellipse(330,212,5,5);
    ellipse(360,118,5,5);
    ellipse(380,20,5,5);
    ellipse(560,18,5,5);
    ellipse(550,8,5,5);
    ellipse(570,45,5,5);
    ellipse(590,33,5,5);
    ellipse(440,22,5,5);
    ellipse(770,65,5,5);
    ellipse(550,73,5,5);
    ellipse(880,87,5,5);
    ellipse(1100,266,5,5);
    ellipse(470,203,5,5);
    ellipse(670,120,5,5);
    ellipse(1400,185,5,5);
    ellipse(1200,143,5,5);
    ellipse(1340,267,5,5);
    ellipse(1270,26,5,5);
    ellipse(1190,127,5,5);
    ellipse(1124,245,5,5);
    ellipse(1545,27,5,5);
    ellipse(921,234,5,5);
    ellipse(467,265,5,5);
    ellipse(429,78,5,5);
    ellipse(1370,45,5,5);
    ellipse(1245,84,5,5);
    ellipse(1127,127,5,5);
    ellipse(1498,86,5,5);



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
 if(cloudaaa > width + 200)
  {
    cloudaaa = -200;
    cloudbbb = -150;
  }
  
  if(cloudbbb > width + 200)
  {
    cloudaaa = -200;
    cloudbbb = -150;
  }
 
  ellipse(cloudaa,100,100,100);
  ellipse(cloudaa,150,200,100);
  ellipse(cloudbb,100,50,50);
  if(cloudaa > width + 200)
  {
    cloudaa = -200;
    cloudbb = -150;
  }
  
  if(cloudbb > width + 200)
  {
    cloudaa = -200;
    cloudbb = -150;
  }

  
  ellipse(cloudaaa,100,100,100);
  ellipse(cloudaaa,150,200,100);
  ellipse(cloudbbb,100,50,50);
  if(clouda > width + 200)
  {
    clouda = -200;
    cloudb = -150;
  }
  
  if(cloudb > width + 200)
  {
    clouda = -200;
    cloudb = -150;
  }
}

void drawbob ()
{
  fill(222,184,135);
  ellipse(boba, bobb, 75, 75);
  if (key == 'a'){
    boba = boba - 2;
  }
  
  if (key == 'd'){
    boba = boba + 2;
  }
  
  if (key == 'w'){
    bobb = bobb - 2;
  }
  
  if (key == 's'){
    bobb = bobb + 2;
  }
}
