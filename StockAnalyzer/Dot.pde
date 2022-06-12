public class Dot {
  private int x;
  private int y;
  
  public Dot(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  int getX() {
    return this.x;
  }
  
  int getY() {
    return this.y;
  }
  
  void plotPoint(int xCor, int yCor){
    
    this.x  = xCor;
    this.y = yCor;

    if (xCor > 60 && xCor < 1140 && yCor > 40 && yCor < 720) {
      stroke(0);
      fill(255,255,255);
      circle(xCor, yCor, 1);
    } else {
      stroke(255);
      fill(255,255,255);
      circle(xCor, yCor, 1);
    }

  }
}
