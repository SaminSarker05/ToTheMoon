public class Button {
  private int xcor;
  private int ycor;
  private String tool;
  
  public Button(int x, int y, String toolName) {
    this.xcor = x;
    this.ycor = y;
    this.tool = toolName;
  }
  
  void load() {
    fill(180);
    rect(xcor, ycor, 75, 75);
    fill(0);
    textSize(10);
    text(tool, 80, ycor+40);
  }
  
  void checkPress() {
    if ((mouseX >= xcor && mouseX <= xcor + 75) && (mouseY >= ycor && mouseY <= ycor + 75)){
      cursor(ARROW);
      fill(200);
      rect(60, 120, 75, 75);
      if (ycor == 120) {
        mouseOnButton = 1;
      } else if (ycor == 250) {
        mouseOnButton = 2;
      } else if (ycor == 380) {
        mouseOnButton = 3;
      }
      
      fill(0);
      text(tool, 80, ycor+40);
    }
  }
}
