String mode = "Pointer";
String ticker;
Graph instance = new Graph();
int currX;
int currY;
int mouseOnButton;
boolean fpoint = false;
int sx, sy;
/*
float scale = 1.1;
float xPan = 600;
float yPan = 375;
boolean zoomIn = false;
boolean zoomOut = false;
float zoomSpeed = 1.04;
*/

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
  /*
  translate(width / 2, height / 2); // zooms to center of screen
  scale(scale);
  translate(-xPan, -yPan);
  if (zoomIn) {
    scale *= zoomSpeed;
  }
  if (zoomOut) {
    scale /= zoomSpeed;
  }
  */
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
  }
}
/*
void keyPressed() {
    if (keyCode == UP) {
      zoomIn = true;
      zoomOut = false;
    }
    if (keyCode == DOWN) {
      zoomOut = true;
      zoomIn = false;
    } 
  }
  
  void keyReleased() {
    if (keyCode == UP) {
      zoomIn = false;
    } 
    if (keyCode == DOWN) {
      zoomOut = false;
    }
  }
*/

//---------------------------------------------------------------

/*

float scale = 1.5; // controls how zoomed it it is
float xPan = 720;
float yPan = 450;
boolean zoomIn = false;
boolean zoomOut = false;
boolean panUp = false;
boolean panDown = false;
boolean panLeft = false;
boolean panRight = false;
float panSpeed = 5;
float zoomSpeed = 1.04;


void setup() {
  size(1440, 900);
}

void draw() {
  translate(width / 2, height / 2); // zooms to center of screen
  scale(scale);
  translate(-xPan, -yPan);
  background(200);
  fill(255, 0, 0);
  rect(200, 200, 300, 300);
  fill(0, 255, 0);
  ellipse(1000, 250, 200, 200);
  fill(0, 0, 255);
  triangle(500, 600, 700, 600, 600, 800);
  if (zoomIn) {
    scale *= zoomSpeed;
  }
  if (zoomOut) {
    scale /= zoomSpeed;
  }
  if (panUp) {
    yPan -= panSpeed;
  }
  if (panDown) {
    yPan += panSpeed;
  }
  if (panLeft) {
    xPan -= panSpeed;
  }
  if (panRight) {
    xPan += panSpeed;
  }
}
  
  void keyPressed() {
    if (keyCode == UP) {
      zoomIn = true;
      zoomOut = false;
    }
    if (keyCode == DOWN) {
      zoomOut = true;
      zoomIn = false;
    } 
    if (key == 'w') {
      panUp = true;
      panDown = false;
    } 
    if (key == 's') {
      panDown = true;
      panUp = false;
    } 
    if (key == 'a') {
      panLeft = true;
      panRight = false;
    }
    if (key == 'd') {
      panLeft = false;
      panRight = true;
    }
  }
  
  void keyReleased() {
    if (keyCode == UP) {
      zoomIn = false;
    } 
    if (keyCode == DOWN) {
      zoomOut = false;
    }
    if (key == 'w') {
      panUp = false;
    }
    if (key == 's') {
      panDown = false;
    }
    if (key == 'a') {
      panLeft = false;
    }
    if (key == 'd') {
      panRight = false;
    }
  }
*/
