int [] tom = {};
int ryk = 100;

boolean tryk = false;

void setup() {
  size (1200,800);
}

void draw() {
  background (0);
  if (tryk ==true) {
    tom = append(tom, 1);
  }
  
  for (int i = 0; i < tom.length; i++) {
    fill (255);
    rect (10+ryk*i, 10, 10, 10);
  }
}

void mousePressed () {
  tryk = true;
}

void mouseReleased () {
  tryk =false;
}
