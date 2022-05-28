public class Tools {
  private String mode;

  public Tools (String mode) {
    this.mode = mode;
  }
  
  void display() {
    if (mode.equals("marker")) {
      if (mousePressed == true) {
        stroke(51, 255, 255);
        strokeWeight(12);
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
    
    if (mode.equals("trendline")) {
      
    }
    
  }

}
