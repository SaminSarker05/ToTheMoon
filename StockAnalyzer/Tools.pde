public class Tools {
  private String mode;
  private boolean fpoint;
  private ArrayList<Dot> dots = new ArrayList<Dot>();


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
     if (mode.equals("TrendLine")) {
       if (!((mouseX >= 5 && mouseX <= 5 + 50) && (mouseY >= (40 + 60) && mouseY <= (40 + 60 + 50)))) {
         fill(0,0,0);
         circle(sx, sy, 6.0);
       }
     }
   }
   
   void displayTrendLineTwo(int sx, int sy) {
    if (mode.equals("TrendLine")) {
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
  
  
  void displaySMA(ArrayList<Candle> Candles) {
    
    
    if (mode.equals("S.M.A")){
      int xcor = 1080;
      double yAvgCor = 0;
      for (int i = 0; i < Candles.size(); i++){
        if (i + 20 < Candles.size()){
          for (int j = i; j < i + 20; j++) {
            yAvgCor += Candles.get(j).getHeight();
          }
          yAvgCor /= 20;
          Dot d = new Dot(xcor, 1300 - (int) yAvgCor);
          dots.add(d);
          instance.plotPoint(xcor,  1300 - (int) yAvgCor);
          yAvgCor = 0;
        }
        xcor -= 6;
      }
    }
    
    //for (int i = 0; i < dots.size()-1; i++) {
    //  stroke(82,158,255);
    //  strokeWeight(0.5);
    //  line(dots.get(i).getX(),   dots.get(i).getY(),   dots.get(i+1).getX(),   dots.get(i+1).getY());
    //}
    
   }
   
   
   
   
   
   
   
}
