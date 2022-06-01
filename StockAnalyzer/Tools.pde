public class Tools {
  private String mode;
  private boolean fpoint;

  public Tools (String mode, boolean fpoint) {
    this.mode = mode;
    this.fpoint = fpoint;
  }
  
  void displayMarker() {
    if (mode.equals("Marker")) {
      stroke(51, 255, 255);
      if (mousePressed) {
        strokeWeight(2);
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  }
    
   void displayTrendLineOne(int sx, int sy) {
    if (mode.equals("TrendLine")) {
      fill(0,255,0);
      circle(sx, sy, 12.0);
    }
   }
   
   void displayTrendLineTwo(int sx, int sy) {
    if (mode.equals("TrendLine")) {
      fill(255, 0,0);
      circle(mouseX, mouseY, 12.0);
      stroke(0);
      line(sx, sy, mouseX, mouseY);
    }
   }
   
   void displayText() {
     
     
     String message = "stuff";
     if (mode.equals("TextBox")) {
       
       if (mousePressed) {
         strokeWeight(2);
         text(message, mouseX, mouseY);
       }
     }
  }
}
