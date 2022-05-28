public class Tools {
  private float xplacement;
  private float yplacement;
  private String mode;

  public Tools (float xplacement, float yplacement) {
    this.xplacement = xplacement;
    this.yplacement = yplacement;
    mode = "none";
    
    boolean rightCol = (xplacement >= 100 && yplacement <= 200);
    if (rightCol && yplacement >= 100 && yplacement <= 200) {
      mode = "marker";
    } else if (rightCol && yplacement >= 250 && yplacement <= 350) {
      mode = "trend line";
    } else if (rightCol && yplacement >= 400 && yplacement <= 500) {
      mode = "pointer";
    } else if (rightCol && yplacement >= 550 && yplacement <= 650) {
      mode = "textbox";
    } else if (rightCol && yplacement >= 700 && yplacement <= 800) {
      mode = "delete";
    } 
  }
  
  void display() {
    if (mode.equals("marker")) {
      stroke(51, 255, 255);
      if (mousePressed == true) {
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  }

}
