String mode;
String ticker;

void setup() {
  size(1000, 1000);
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
}
