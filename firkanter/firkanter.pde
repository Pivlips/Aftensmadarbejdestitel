int [] tom = {};
int ryk = 76;

boolean tryk = false;

void setup() {
  size (1280,800);
}

void draw() {
  background (0);
  if (tryk ==true) {
    tom = append(tom, 1);
  }
  
  for (int i = 0; i < tom.length; i++) {
    fill (255);
    rect (80, 193+ryk*i, 172, 75);
    rect (253, 193+ryk*i, 172, 75);
    rect (426, 193+ryk*i, 172, 75);
    
  }
}

void mousePressed () {
  tryk = true;
}

void mouseReleased () {
  tryk =false;
}
