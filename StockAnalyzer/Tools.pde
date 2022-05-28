public class Tools {
  private float xplacement;
  private float yplacement;
  private String mode;

  public Tools (float xplacement, float yplacement, String mode) {
    this.xplacement = xplacement;
    this.yplacement = yplacement;
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
  }

}
