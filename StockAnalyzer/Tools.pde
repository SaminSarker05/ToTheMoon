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
  int mouseX;
  int mouseY;
  
  public Tools(int xPlace, int yPlace){
   mouseX = xPlace;
   mouseY = yPlace;
  
  //values below are place holder for real values
   void display() {
    boolean rightCol = (mouseX >= 100 && mouseX <= 200);
    if (rightCol && mouseY >= 100 && mouseY <= 200) {
      marker();
    } 
  }
    /*else if (rightCol && mouseY >= 250 && mouseY <= 350) {
      
    } else if (rightCol && mouseY >= 400 && mouseY <= 500) {
      
    } else if (rightCol && mouseY >= 550 && mouseY <= 650) {
      
    } else if (rightCol && mouseY >= 700 && mouseY <= 800) {
      
    } else if (rightCol && mouseY >= 850 && mouseY <= 950) {

    }
    
    if (mode.equals("trendline")) {
      
    }
    
  }
}
