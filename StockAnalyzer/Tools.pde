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
     if (!((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60) && mouseY <= (40 + 60 + 50)))) {
        if (mode.equals("TrendLine")) {
        fill(0,0,0);
        circle(sx, sy, 6.0);
    }
     }
    
   }
   
   void displayTrendLineTwo(int sx, int sy) {
     if (!((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60) && mouseY <= (40 + 60 + 50)))) {
    if (mode.equals("TrendLine")) {
      fill(0, 0,0);
      circle(mouseX, mouseY, 6.0);
      stroke(0);
      line(sx, sy, mouseX, mouseY);
    }
     }
   }
   
   void displayText(String text) {
     String message = text;
     if (mode.equals("TextBox")) {
       
       if (mousePressed) {
         stroke(100, 100, 100);
         fill(0);
         text(message, mouseX, mouseY);
       }
     }
  }
}
