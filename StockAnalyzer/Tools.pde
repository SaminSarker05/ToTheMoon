public class Tools {
  private float xplacement;
  private float yplacement;
  private String mode;

  public Tools (float xplacement, float yplacement) {
    this.xplacement = xplacement;
    this.yplacement = yplacement;
    
    boolean rightCol = (mouseX >= 100 && mouseX <= 200);
    if (rightCol && mouseY >= 100 && mouseY <= 200) {
      mode = "marker";
    } else if (rightCol && mouseY >= 250 && mouseY <= 350) {
      mode = "trend line";
    } else if (rightCol && mouseY >= 400 && mouseY <= 500) {
      mode = "pointer";
    } else if (rightCol && mouseY >= 550 && mouseY <= 650) {
      mode = "textbox";
    } else if (rightCol && mouseY >= 700 && mouseY <= 800) {
      mode = "delete";
    } 
  }
     
     //values below are place holder for real values
     void display() {
     
     }
     
     
     void marker() {
     stroke(51, 255, 255);
     if (mousePressed == true) {
     line(mouseX, mouseY, pmouseX, pmouseY);
     }
     }
     
     void trendLine() {
     stroke(51, 255, 255);
     }
     
     }
