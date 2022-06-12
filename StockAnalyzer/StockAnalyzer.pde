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
boolean movePoints = false;

void startScreen() {
  background(0);
}

void setup() {
  frameRate(1000);
  size(1400, 750);
  background(255);
  instance.start("TSLA");
  
}

void draw() {
  buildLines();

  fill(0);
  stroke(255);
  textSize(20);
  text("TSLA / USD  1D", 70, 80);

  fill(200);
  rect(5, 40, 50, 50);
  fill(0);
  textSize(10);
  text("Marker", 14, 40 + 50/2);

  fill(200);
  rect(5, 40 + 60, 50, 50);
  fill(0);
  textSize(10);
  text("Trend", 16, 40 + 60 + 50/2);

  fill(200);
  rect(5, 40 + 60 * 2, 50, 50);
  fill(0);
  textSize(10);
  text("TextBox", 11, 40 + 60 * 2 + 50/2);

  fill(200);
  rect(5, 40 + 60 * 3, 50, 50);
  fill(0);
  textSize(10);
  text("S.M.A", 17, 40 + 60 * 3 + 29);


  fill(200);
  rect(5, 40 + 60 * 4, 50, 50);
  fill(0);
  textSize(10);
  text("Fib", 23, 40 + 60 * 4 + 29);

  fill(200);
  rect(5, 40 + 60 * 5, 50, 50);
  fill(0);
  textSize(10);
  text("Bollinger", 9,  40 + 60 * 5 + 29);

  fill(200);
  rect(5, 40 + 60 * 6, 50, 50);

  if ((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= 40 && mouseY <= 40 + 50)) {
    cursor(ARROW);
    fill(220);
    rect(5, 40, 50, 50);
    stroke(0);
    fill(0);
    text("Marker", 14, 40 + 50/2);
    mouseOnButton = 1;
  } else if ((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60) && mouseY <= (40 + 60 + 50))) {
    cursor(ARROW);
    fill(220);
    rect(5, 40 + 60, 50, 50);
    textSize(10);
    stroke(0);
    fill(0);
    text("Trend", 16, 40 + 60 + 50/2);
    mouseOnButton = 2;
  } else if ((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60 * 2) && mouseY <= (40 + 60 * 2 + 50))) {
    cursor(ARROW);
    fill(220);
    rect(5, 40 + 60 * 2, 50, 50);
    textSize(10);
    stroke(0);
    fill(0);
    text("TextBox", 11, 40 + 60 * 2 + 50/2);
    mouseOnButton = 3;
  } else if ((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60 * 3) && mouseY <= (40 + 60 * 3 + 50))) {
    cursor(ARROW);
    fill(220);
    rect(5, 40 + 60 * 3, 50, 50);
    textSize(10);
    stroke(0);
    fill(0);
    text("S.M.A", 17, 40 + 60 * 3 + 50/2);
    mouseOnButton = 4;
  } else if ((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60 * 4) && mouseY <= (40 + 60 * 4 + 50))) {
    cursor(ARROW);
    fill(220);
    rect(5, 40 + 60 * 4, 50, 50);
    textSize(10);
    stroke(0);
    text("Fib", 23, 40 + 60 * 4 + 50/2);
    mouseOnButton = 5;
  } else if ((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60 * 5) && mouseY <= (40 + 60 * 5 + 50))) {
    cursor(ARROW);
    fill(220);
    rect(5, 40 + 60 * 5, 50, 50);
    textSize(10);
    stroke(0);
    text("Bollinger", 9, 40 + 60 * 5 + 50/2);
    mouseOnButton = 6;
  } else if ((mouseX > 60 && mouseX < 60 + 1080) && (mouseY > 40  && mouseY < 40 + 680)) {
    cursor(CROSS);
    mouseOnButton = -1;
  } else {
    cursor(ARROW);
    mouseOnButton = -1;
  }
  
  Tools x = new Tools(mode, fpoint);
  x.displayMarker();
  x.displayText(saved);
  x.displaySMA(instance.Candles);
  
  
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
      if (mode.equals("TrendLine")) {
        x.displayTrendLineTwo(sx, sy);
        fpoint = false;
      } else if (mode.equals("Fib")) {
        x.displayTrendLineThree(sx, sy);
        fpoint = false;
      }
    }
  }
}

void mousePressed() {
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
    System.out.println("here");
    stroke(0);
    fill(0);
    textSize(13); 
    text("Type message and press enter. Then click anywhere to insert text", 450, 70);
  } else if (mouseOnButton == 3 && mode.equals("TextBox")) {
    mode = "Pointer";
    saved = "";
  }
  if ((mouseOnButton == 4 && mode.equals("Pointer"))) {
    mode = "S.M.A";
  } else if (mouseOnButton == 4 && mode.equals("S.M.A")) {
    mode = "Pointer";
  }

  if ((mouseOnButton == 5 && mode.equals("Pointer"))) {
    mode = "Fib";
  } else if (mouseOnButton == 5 && mode.equals("Fib")) {
    mode = "Pointer";
  }
  
  if ((mouseOnButton == 6 && mode.equals("Pointer"))) {
    mode = "Bollinger";
  } else if (mouseOnButton == 6 && mode.equals("Bollinger")) {
    mode = "Pointer";
  }
  
  
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
  if (mode.equals("Pointer")) {

    instance.shiftCandles(shiftX, shiftY);
    
    if (shiftY != 0) shift = true;
    if (shiftX != 0) shift = true;
    instance.buildYAxis(shiftY);
    instance.buildXAxis(shiftX);
  }
  
  if (mode.equals("S.M.A")){
    instance.shiftCandlesAndPoints(shiftX, shiftY);
    if (shiftY != 0) shift = true;
    if (shiftX != 0) shift = true;
    instance.buildYAxis(shiftY);
    instance.buildXAxis(shiftX);
  }
  
  if (mode.equals("Bollinger")) {
    instance.shiftCandlesAndPointsTwo(shiftX, shiftY);
    if (shiftY != 0) shift = true;
    if (shiftX != 0) shift = true;
    instance.buildYAxis(shiftY);
    instance.buildXAxis(shiftX);
  }
}

void keyPressed() {
  if (mode == "TextBox") {
    if (key == '\n') {
      saved = typing;
      typing = "";
    } else {
      typing += key;
    }
  }
}

void buildLines() {
  for (int i = 110; i < 60 + 1080; i += 50) {
    stroke(220);
    strokeWeight(1);
    line(i, 40, i, 40 + 680);
  }

  for (int i = 100; i < 40 + 680; i += 60) {
    stroke(220);
    strokeWeight(1);
    line(60, i, 60 + 1080, i);
  }
}
