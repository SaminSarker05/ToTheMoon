String mode = "Pointer";
String ticker;
Graph instance = new Graph();
int currX;
int currY;
int mouseOnButton;
boolean fpoint = false;
int sx, sy;
boolean shift = false;
String typing = "";
String saved = "";

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
  rect(60, 120, 75, 75);
  fill(0);
  textSize(10);
  text("Marker", 83, 160);
  
  fill(180);
  rect(60, 250, 75, 75);
  fill(0);
  textSize(10);
  text("TrendLine", 76, 290);
  
  fill(180);
  rect(60, 380, 75, 75);
  fill(0);
  textSize(10);
  text("TextBox", 78, 420);
  
  if ((mouseX >= 60 && mouseX <= 60 + 75) && (mouseY >= 120 && mouseY <= 120 + 75)){
    cursor(ARROW);
    fill(200);
    rect(60, 120, 75, 75);
    mouseOnButton = 1;
    fill(0);
    text("Marker", 83, 160);
  } else if ((mouseX >= 60 && mouseX <= 60 + 75) && (mouseY >= 250 && mouseY <= 250 + 75)) {
    cursor(ARROW);
    fill(200);
    rect(60, 250, 75, 75);
    mouseOnButton = 2;
    fill(0);
    text("TrendLine", 76, 290);
  } else if ((mouseX >= 60 && mouseX <= 60 + 75) && (mouseY >= 380 && mouseY <= 380 + 75)) {
    cursor(ARROW);
    fill(200);
    rect(60, 380, 75, 75);
    mouseOnButton = 3;
    fill(0);
    text("TextBox", 78, 420);
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
  x.displayText(saved);
  
  
  if (shift == false) {
    instance.buildYAxis(0);
    //instance.buildXAxis(0);
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
  if ((mouseOnButton == 3 && mode.equals("Pointer"))) {
    mode = "TextBox";
    text("Type message and press enter. Then click anywhere to insert text", 450,700);
  } else if (mouseOnButton == 3 && mode.equals("TextBox")) {
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

void keyPressed() {
  if (mode == "TextBox"){
    if (key == '\n'){
    saved = typing;
    typing = "";
    } else {
      typing += key;
    }
  }
}
