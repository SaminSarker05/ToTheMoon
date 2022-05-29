char mode;
String ticker;
Graph instance = new Graph();
int currX;
int currY;

void setup() {
  size(1200, 820);
  //fullScreen();
  background(255);
  instance.start();
}

void draw() {  

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
