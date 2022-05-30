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
        strokeWeight(5);
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  }
}
