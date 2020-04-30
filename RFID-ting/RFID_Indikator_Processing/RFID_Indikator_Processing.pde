import processing.serial.*;
//////////////////////////
// Variable Definitions //
//////////////////////////
Serial myPort;                    //Lav Serial objekt
String dataWemos = "Intet endnu"; //Lav String til at gemme serial data
String kortNum = "Intet endnu";   //Lav String til at gemme status fra serial data
int kortNumTid = 0;
String name1, name2;

void setup()
{
  size(600, 250);                  //Sæt canvas størrelse
  String portName = Serial.list() [1]; //Ofte er det 0, men på mac er det ofte 1
  println("Prøver: " + portName);
  myPort = new Serial(this, portName, 115200);

  textSize(32);
  fill(0, 102, 153);

  name1 = "oof";
  name2 = "aah";
}

void draw()
{
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
  } // Received stop

  //println(kortNumTid + " : " + (millis()+5000));
  if (kortNumTid < millis() && int(kortNum) != 0) {
    kortNum = "Time Out!";
    kortNumTid = 0;
  }
  background(254);
  text("Fundet kort som tekst: " + kortNum, 10, 30);
  text("Fundet kort som int: " + int(kortNum), 10, 60);

  if (int(kortNum) == 1) {
    text("Velkommen " + name1, 10, 90);
  }
  if (int(kortNum) == 2) {
    text("Velkommen " + name2, 10, 90);
  }

  if (mousePressed == true)    //Der trykkes på canvas
  {
    myPort.write('1');         //send 1 til Wemos
    text("Mouse pressed!!!!", 10, 210);
    print("MP ");
  } else {
    myPort.write('0');         //send 0 til Wemos
    text("Mouse NOT pressed", 10, 210);
  }
}
