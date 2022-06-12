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
    if ((mode.equals("TrendLine") && (!((mouseX >= 0 && mouseX <= 80) && (mouseY >= (90) && mouseY <= (170))))) || ((mode.equals("Fib")) && (!((mouseX >= 0 && mouseX <= 80) && (mouseY >= (200) && mouseY <= (280)))))) {
      fill(0);
      circle(sx, sy, 12.0);
    }
     if (mode.equals("TrendLine") || mode.equals("Fib")) {
       if ((!((mouseX >= 0 && mouseX <= 80) && (mouseY >= (90) && mouseY <= (170)))) && (!((mouseX >= 0 && mouseX <= 80) && (mouseY >= (200) && mouseY <= (280))))) {
         fill(0,0,0);
         circle(sx, sy, 6.0);
       }
     }
   }
   
   void displayTrendLineTwo(int sx, int sy) {
    if (mode.equals("TrendLine")) {
      fill(0);
      circle(mouseX, mouseY, 12.0);
      if ((!((mouseX >= 5 && mouseX <= 55) && (mouseY >= (100) && mouseY <= (150))))) {
        fill(0, 0,0);
        circle(mouseX, mouseY, 6.0);
        stroke(0);
        line(sx, sy, mouseX, mouseY);
      }
     }
   }
   
   void displayTrendLineThree(int sx, int sy) {
    if (mode.equals("Fib")) {
      fill(0);
      circle(mouseX, mouseY, 12.0);
      if ((!((mouseX >= 0 && mouseX <= 80) && (mouseY >= (200) && mouseY <= (280))))) {
        fill(0, 0,0);
        circle(mouseX, mouseY, 6.0);
        stroke(0);
        line(sx, sy, mouseX, mouseY);
      }
     }
     if (mouseY > sy) {
       float distance = mouseY - sy;
       float beginning = mouseY;
     } else {
       float distance = sy - mouseY;
       float beginning = sy;
     }
     float p1y = (distance * 0.236) + beginning;
     float p2y = (distance * 0.382) + beginning;
     float p3y = (distance * 0.618) + beginning;
     float p4y = (distance * 0.788) + beginning;
     float p5y = distance + beginning;
     
     //23.6, 38.2, 61.8, 78.6
     
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
  
  void displayAverage(ArrayList<Candle> allCandles) {
    int size = allCandles.size();
    double total = 0.0;
    ArrayList<Double> averages = new ArrayList<Double>();
    for (int x = size - 1; x > 19; x--) {
      total += allCandles.get(x).getClose();
      for (int y = size-2; y > x-20; y--) {
        total += allCandles.get(y).getClose();
      }
      averages.add(0, total/20);
      total = 0;
    }
    for (int x = 19; x >= 0; x--) {
      total += allCandles.get(x).getClose();
      for (int y = x - 1; y >= 0; y--) {
        total += allCandles.get(y).getClose();
      }
      averages.add(0, total/20);
      total = 0;
    }
    
  }
  
}
