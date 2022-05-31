String mode = "Pointer";
String ticker;
Graph instance = new Graph();
int currX;
int currY;
int mouseOnButton;
boolean fpoint = false;
int sx, sy;
boolean shift = false;

void setup() {
  size(1200, 750);
  background(255);
  instance.start();
}

void draw(){
  
  fill(0);
  textSize(20);
  text("TSLA / USD  1D", 60, 80);
  fill(180);
  rect(100, 120, 100, 100);
  fill(0);
  textSize(10);
  text("Marker", 134, 170);
  fill(180);
  rect(100, 250, 100, 100);
  fill(0);
  textSize(10);
  text("TrendLine", 125, 300);
  if ((mouseX >= 100 && mouseX <= 200) && (mouseY >= 100 && mouseY <= 200)){
    cursor(ARROW);
    fill(200);
    rect(100, 120, 100, 100);
    mouseOnButton = 1;
    fill(0);
    text("Marker", 134, 170);
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
    //int x = mouseX;
    //int y = mouseY;
    //stroke(0);
    //line(40, y, x, y);
    //line(x, y, 1140, y);
    //line(x, 40, x, y);
    //line(x, y, x, 720);
  } else {
    cursor(ARROW);
    mouseOnButton = -1;
  }
  Tools x = new Tools(mode, fpoint);
  x.displayMarker();
  
  
  if (shift == false) {
    instance.buildYAxis(0);
    instance.buildXAxis(0);
  }
}

void mouseClicked() {
  if (!((mouseX >= 100 && mouseX <= 200) && (mouseY >= 250 && mouseY <= 350))) {
    Tools x = new Tools(mode, fpoint);
    if (!fpoint) {
      sx = mouseX;
      sy = mouseY;
      x.displayTrendLineOne(sx, sy);
      fpoint = true;
    } else {
      x.displayTrendLineTwo(sx, sy);
      fpoint = false;
    }
  }
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
    if (shiftY != 0) shift = true;
    if (shiftX != 0) shift = true;
    instance.buildYAxis(shiftY);
    instance.buildXAxis(shiftX);
  }
}
