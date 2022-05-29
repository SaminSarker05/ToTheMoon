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
  //if ()

}

void mousePressed(){
  currX = mouseX;
  currY = mouseY;

}


void mouseDragged() {
  int shiftX;
  int shiftY;
  
  if (mouseX > currX) {
    //System.out.println("shift left");
    //instance.shiftCandles(1, mouseX-currX);
    shiftX = 10;
  }
  else if (mouseX < currX) {
    //System.out.println("shift right");
    //instance.shiftCandles(-1, currX-mouseX);
    shiftX = -10;
  } else shiftX = 0;
  
  if (mouseY > currY) {
    shiftY = -10;
    
  }
  else if (mouseY < currY) {
    shiftY = 10;
    
  } else shiftY = 0;
  instance.shiftCandles(shiftX, shiftY);
}
