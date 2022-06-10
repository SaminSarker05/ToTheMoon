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
    if (mode.equals("TrendLine") && (!((mouseX >= 0 && mouseX <= 80) && (mouseY >= (90) && mouseY <= (170))))) {
      fill(0);
      circle(sx, sy, 12.0);
    }
     if (mode.equals("TrendLine")) {
       if ((!((mouseX >= 0 && mouseX <= 80) && (mouseY >= (90) && mouseY <= (170))))) {
         fill(0,0,0);
         circle(sx, sy, 6.0);
       }
     }
   }
   
   void displayTrendLineTwo(int sx, int sy) {
    if (mode.equals("TrendLine")) {
      fill(0);
      circle(mouseX, mouseY, 12.0);
      if (!((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60) && mouseY <= (40 + 60 + 50)))) {
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
