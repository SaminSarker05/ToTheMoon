String mode;
String ticker;
Graph instance = new Graph();
int currX;
int currY;

void setup() {
  size(1200, 750);
  background(255);
}

void draw() {
  //Candle c = new Candle(100.0, 50.0, 90.0, 70.0);
  //c.display();
  if ((mouseX >= 100 && mouseX <= 100) && (mouseY >= 100 && mouseY <= 200)) {
    if (mousePressed == true) {
      mode = "marker";      
    } 
  } else {
    mode = "none";
  }
  Tools x = new Tools(mode);
  x.display();
  instance.start();
}

void draw(){
  if ((mouseX > 40 && mouseX < 1140) && (mouseY > 40 && mouseY < 720)){
    cursor(CROSS);
    //line(0.0, mouseX, mouseY ,0);
  } else cursor(ARROW);
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
