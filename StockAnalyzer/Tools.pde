public class Tools {
  
  private String mode;

  public Tools (String mode) {
    this.mode = mode;
    display();
  }
  
  void display() {
    if (mode.equals("Marker")) {
      stroke(51, 255, 255);
      if (mousePressed) {
        strokeWeight(3);
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
    
    if (mode.equals("TrendLine")) {
       boolean running = false;
       cursor(HAND);
       int sx = -1;
       int sy = -1;
       if (mousePressed && (sx == -1 && sy == -1)) {
          sx = mouseX;
          sy = mouseY;
          fill(255,0,0);
          circle(sx, sy, 12.0);
          running = true;
       }
      for (int i = 0; i < 100; i++) {
      
      
        if (mousePressed && (mouseX != sx || mouseY != sy)){
  
            fill(0,255,0);
            circle(mouseX, mouseY, 12.0);      
            stroke(0);
            line(sx, sy, mouseX, mouseY);
            sx = -1;
            sy = -1;
            running = false;
          }
          
        }
      
      
     }
  }
   
}
