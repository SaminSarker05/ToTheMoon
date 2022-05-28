char mode;
String ticker;

void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  //Candle c = new Candle(100.0, 50.0, 90.0, 70.0);
  //c.display();\
  if (mode == 'o') {
    if ((mouseX >= 100 && mouseY <= 200) && (mouseX >= 100 && mouseY <= 200)) {
      Tools x = new Tools(mouseX, mouseY);
      x.display();
    }
  }
}

void mousePressed() {
  mode = 'o';
}
