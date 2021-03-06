String mode = "Pointer";
String ticker;
int mouseOnButton;
int currX;
int currY;
boolean fpoint = false;
int sx, sy;
boolean shift = false;
String typing = "";
String saved = "";
boolean movePoints = false;
boolean start = true;
boolean once = true;
PFont font;
Graph instance = new Graph();


void setup() {
  size(1195, 750);
  frameRate(1000);
  background(255);
  fill(0);
  font = loadFont("mono.vlw");
  textFont(font);
  textSize(20);
  text("Enter a ticker symbol: ", 100, 100);
  text("Stocks to choose form:", 800, 100);
  text("tsla", 800, 200);
  text("amd", 800, 250);
  text("nvda", 800, 300);
  text("spy", 800, 350);
  text("aapl", 800, 400);
}

void draw() {
  if (start == false && once) {
    instance.start(ticker);
    once = false;
  }
  
  if (start == false){
    buildLines();
    
    fill(0);
    stroke(1);
    textSize(20);
    text(ticker + " / USD  1D", 70, 80);
  
    fill(200);
    rect(10, 50, 40, 40);
    fill(0);
    stroke(1);
    textSize(10);
    text("Pen", 21, 47 + 50/2);
  
    fill(200);
    rect(10, 50 + 60, 40, 40);
    fill(0);
    stroke(1);
    textSize(10);
    text("Trend", 16, 47 + 60 + 50/2);
  
    fill(200);
    rect(10, 50 + 120, 40, 40);
    fill(0);
    stroke(1);
    textSize(10);
    text("Text", 19, 47 + 60 * 2 + 50/2);
  
    fill(200);
    rect(10, 50 + 180, 40, 40);
    fill(0);
    stroke(1);
    textSize(10);
    text("Sma", 20, 46 + 60 * 3 + 29);
  
    fill(200);
    rect(10, 50 + 240, 40, 40);
    fill(0);
    stroke(1);
    textSize(10);
    text("Fibb", 20, 45 + 60 * 4 + 29);
  
    fill(200);
    rect(10, 50 + 300, 40, 40);
    fill(0);
    stroke(1);
    textSize(10);
    text("BB", 24,  46 + 60 * 5 + 29);
    
    if ((mouseX >= 10 && mouseX <= 50) && (mouseY >= 50 && mouseY <= 50 + 40)) {
      cursor(ARROW);
      fill(220);
      rect(10, 50, 40, 40);
      stroke(0);
      fill(0);
      text("Pen", 21, 47 + 50/2);
      mouseOnButton = 1;
    } else if ((mouseX >= 10 && mouseX <= 50) && (mouseY >= (50 + 60) && mouseY <= (50 + 60 + 40))) {
      cursor(ARROW);
      fill(220);
      rect(10, 50 + 60, 40, 40);
      textSize(10);
      stroke(0);
      fill(0);
      text("Trend", 16, 47 + 60 + 50/2);
      mouseOnButton = 2;
    } else if ((mouseX >= 10 && mouseX <= 50) && (mouseY >= (50 + 60 * 2) && mouseY <= (50 + 60 * 2 + 40))) {
      cursor(ARROW);
      fill(220);
      rect(10, 50 + 120, 40, 40);
      textSize(10);
      stroke(0);
      fill(0);
      text("Text", 19, 47 + 60 * 2 + 50/2);
      mouseOnButton = 3;
    } else if ((mouseX >= 10 && mouseX <= 50) && (mouseY >= (50 + 60 * 3) && mouseY <= (50 + 60 * 3 + 40))) {
      cursor(ARROW);
      fill(220);
      rect(10, 50 + 180, 40, 40);
      textSize(10);
      stroke(0);
      fill(0);
      text("Sma", 20, 46 + 60 * 3 + 29);
      mouseOnButton = 4;
    } else if ((mouseX >= 10 && mouseX <= 50) && (mouseY >= (50 + 60 * 4) && mouseY <= (50 + 60 * 4 + 40))) {
      cursor(ARROW);
      fill(220);
      rect(10, 50 + 240, 40, 40);
      textSize(10);
      stroke(0);
      fill(0);
      text("Fibb", 20, 45 + 60 * 4 + 29);
      mouseOnButton = 5;
    } else if ((mouseX >= 10 && mouseX <= 50) && (mouseY >= (50 + 60 * 5) && mouseY <= (50 + 60 * 5 + 40))) {
      cursor(ARROW);
      fill(220);
      rect(10, 50 + 300, 40, 40);
      textSize(10);
      stroke(0);
      fill(0);
      text("BB", 24,  46 + 60 * 5 + 29);
      mouseOnButton = 6;
    } else if ((mouseX > 60 && mouseX < 60 + 1080) && (mouseY >= 40  && mouseY < 40 + 680)) {
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
}

void mouseClicked() {
  if (mode != "Pointer" && (!((mouseX >= 10 && mouseX <= 100) && (mouseY >= 60 && mouseY <= 350)))) {
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
    typing = "";
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
  if (mouseOnButton == 7) {
    start = true;
    once = true;
    setup();
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
  if (start) {
    if (key == BACKSPACE){
      typing = "";
      setup();
    } else if (key == '\n') {
      if (!(typing.equals("tsla") || typing.equals("spy") || typing.equals("amd") || typing.equals("aapl") || typing.equals("nvda"))) {
        typing = "";
        setup();
      } else {
        start = false;
        ticker = typing;
      }
    } else {
      stroke(0);
      typing += key;
      text(typing, 100, 200);
    }
  }
  
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
  for (int i = 110; i < 60 + 1080; i += 70) {
    stroke(220);
    strokeWeight(0.5);
    line(i, 40, i, 40 + 680);
  }

  for (int i = 100; i < 40 + 680; i += 50) {
    stroke(220);
    strokeWeight(0.5);
    line(60, i, 60 + 1080, i);
  }
}
