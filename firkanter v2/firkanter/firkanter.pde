import processing.serial.*;
//////////////////////////
// Variable Definitions //
//////////////////////////
Serial myPort;                    //Lav Serial objekt
String dataWemos = "Intet endnu"; //Lav String til at gemme serial data
String kortNum = "Intet endnu";   //Lav String til at gemme status fra serial data
int kortNumTid = 0;
String name1, name2;
boolean mad1, mad2; 

int [] tom = {};
int ryk = 100;

boolean tryk = false;

void setup() {
  size (1200,800);
   String portName = Serial.list() [1];
  println("Prøver: " + portName);
  myPort = new Serial(this, portName, 115200);
  
  
}

void draw() {
  background (0);
  if (myPort.available() > 0)  //Er data parat?
  {
    dataWemos = myPort.readStringUntil('\n');  //Læs data og gem det
    println("Received: " + dataWemos);
    if (dataWemos != null) {
      if (dataWemos.charAt(10) == '#') {       //Fundet en godkendt tag
        println("test");
        kortNum = dataWemos.substring(11, dataWemos.length()-2); //Out of bounds? Prøv højere tal end -3!
        kortNumTid = (millis()+5000);
        println(kortNum);
      }
    }
  }
  //if (tryk ==true) {
    //tom = append(tom, 1);
  //}
   if (int(kortNum) == 1) {
  rect(20,20,30,30);
  tom = append(tom,1);
}

if (int(kortNum) == 2) {
  ellipse(50,50,50,50);
  tom = append(tom,2);
}
  if (int(kortNum) == 3) {
  ellipse(100,100,50,50);
  tom = append(tom,+1);
}

  
    for (int i = 0; i < tom.length; i++) {
    fill (255);
    rect (10+ryk*i, 300, 10, 10);
 }
  

}
