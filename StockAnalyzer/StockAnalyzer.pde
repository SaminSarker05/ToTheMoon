String mode = "Pointer";
String ticker;
Graph instance = new Graph();
int currX;
int currY;
int mouseOnButton;
boolean fpoint = false;

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
  fill(180);
  rect(100, 250, 100, 100);
  fill(0);
  text("TrendLine", 125, 300);
  if ((mouseX >= 100 && mouseX <= 200) && (mouseY >= 100 && mouseY <= 200)){
    cursor(ARROW);
    fill(200);
    rect(100, 100, 100, 100);
    mouseOnButton = 1;
    fill(0);
    text("Marker", 134, 150);
  } else if ((mouseX >= 100 && mouseX <= 200) && (mouseY >= 250 && mouseY <= 350)) {
    cursor(ARROW);
    fill(200);
    rect(100, 250, 100, 100);
    mouseOnButton = 2;
    fill(0);
    text("TrendLine", 125, 300);
  } else if ((mouseX > 40 && mouseX < 1140) && (mouseY > 40 && mouseY < 720)) {
    cursor(CROSS);
    mouseOnButton = -1;
  } else {
    cursor(ARROW);
    mouseOnButton = -1;
  }
  Tools x = new Tools(mode, fpoint);
  x.displayMarker();
  if (!fpoint) {
    x.displayTrendLineOne();
  } else {
    
  }
  fpoint = !fpoint;
}

void mousePressed(){
  currX = mouseX;
  currY = mouseY;
  if ((mouseOnButton == 1 && mode.equals("Pointer"))) {
    mode = "Marker";
  } else if (mouseOnButton == 1 && mode.equals("Marker")) {
    mode = "Pointer";
  }
  if ((mouseOnButton == 2 && mode.equals("Pointer"))) {
    mode = "TrendLine";
  } else if (mouseOnButton == 2 && mode.equals("TrendLine")) {
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
