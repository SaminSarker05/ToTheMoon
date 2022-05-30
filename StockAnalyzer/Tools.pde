public class Tools {
  
  private String mode;

  public Tools (String mode) {
    this.mode = mode;
    display();
  }
  
  void display() {
    if (mode.equals("Marker")) {
      stroke(51, 255, 255);
      if (mousePressed == true) {
        strokeWeight(3);
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
    if (mode.equals("TrendLine")) {
      //cursor(ELLIPSE);
      int sx = -1;
      int sy = -1;
      if (mousePressed == true) {
        if (sx == -1 && sy == -1) {
          sx = mouseX;
          sy = mouseY;
          circle(sx, sy, 12.0);
        } else {
          circle(mouseX, mouseY, 12.0);
          stroke(92);
          line(0, 0, 10, 10);
          sx = -1;
          sy = -1;
        }
      }
    }
  }
  
}


/*
int sx
int sy

MouseClicked {
  if sx == -1 && sy == -1
    sx = mousex
    sy = mousey
    
  else 
    line(sx, sy, mousex, mousey)
    sx=0
    sy=0
    
}

draw {
  if sx != -1
  line(sx, sy, mousex, mousey)
}
*/
