String mode;
String ticker;

void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {
  //Candle c = new Candle(100.0, 50.0, 90.0, 70.0);
  //c.display();\
  if (mousePressed == true) {
    boolean rightCol = (mouseX >= 100);
    if (rightCol && mouseY >= 100 && mouseY <= 200) {
      mode = "marker";      
    } else if (rightCol && mouseY >= 250 && mouseY <= 350) {
      //
    } else if (rightCol && mouseY >= 400 && mouseY <= 500) {
      //
    } else if (rightCol && mouseY >= 550 && mouseY <= 650) {
      //
    } else if (rightCol && mouseY >= 700 && mouseY <= 800) {
      //
    } else {
      //
    } 
  }
  Tools x = new Tools(mouseX, mouseY, mode);
  x.display();
  
}
