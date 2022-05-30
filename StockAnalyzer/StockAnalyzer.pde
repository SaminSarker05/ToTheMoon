String mode = "Pointer";
String ticker;
Graph instance = new Graph();
int currX;
int currY;
boolean mouseOnButton;

void setup() {
  size(1200, 750);
  background(255);
  instance.start();
}

void draw(){
  fill(180);
  rect(100, 100, 100, 100);
  fill(0);
  text("Marker", 134, 150);
  if ((mouseX >= 100 && mouseX <= 200) && (mouseY >= 100 && mouseY <= 200)){
    cursor(ARROW);
    fill(200);
    rect(100, 100, 100, 100);
    mouseOnButton = true;
    fill(0);
    text("Marker", 134, 150);
  } else if ((mouseX > 40 && mouseX < 1140) && (mouseY > 40 && mouseY < 720)) {
    cursor(CROSS);
    mouseOnButton = false;
  } else {
    cursor(ARROW);
    mouseOnButton = false;
  }
  Tools x = new Tools(mode);
}

void mousePressed(){
  currX = mouseX;
  currY = mouseY;
  if (mouseOnButton && mode.equals("Pointer")) {
    mode = "Marker";
  } else if (mouseOnButton && mode.equals("Marker")) {
    mode = "Pointer";
  }
}

void mouseDragged() {
  if (mode.equals("Pointer")) {
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
}
