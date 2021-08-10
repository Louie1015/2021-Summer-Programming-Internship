/*
Name: lortiz
Date: 8/10/2021
Program: middleName
*/

String firstName = "Louis";
String middleName = "Nathan";
String lastName = "Ortiz";
String getFullName = (firstName + " " + middleName + " " + lastName);
PFont f;

void setup(){
  size(400,400);
  background(100,150,255);
  f = createFont("Arial",16,true);
  textFont(f,16); 
  fill(0,0,0);
  textAlign(CENTER);
  text( getFullName,width/2,200);
  println(getFullName);
  
   }
