char mode;
String ticker;
Graph instance = new Graph();
int currX;
int currY;

void setup() {
  size(1200, 750);
  background(255);
  instance.start();
}

void draw(){
  //rect(40.0, 40.0, 1000.0, 650.0);
}

void mousePressed(){
  currX = mouseX;
  currY = mouseY;
}


void mouseDragged() {
  int shiftX;
  int shiftY;
  
  if (mouseX > currX) {
    shiftX = 7;
  } else if (mouseX < currX) {
    shiftX = -7;
  } else shiftX = 0;
  
  if (mouseY > currY) {
    shiftY = 7;
  } else if (mouseY < currY) {
    shiftY = -7;
  } else shiftY = 0;
  
  instance.shiftCandles(shiftX, shiftY);
}
