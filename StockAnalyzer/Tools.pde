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
       float p1y = beginning - (distance * 0.236);
       float p2y = beginning - (distance * 0.382);
       float p3y = beginning - (distance * 0.618);
       float p4y = beginning - (distance * 0.786);
       float p5y = beginning - distance;
       line(mouseX, p1y, sx, p1y);
       text("23.6", mouseX - 10, p1y);
       line(mouseX, p2y, sx, p2y);
       text("38.2", mouseX - 10, p2y);
       line(mouseX, p3y, sx, p3y);
       text("61.8", mouseX - 10, p3y);
       line(mouseX, p4y, sx, p4y);
       text("78.6", mouseX - 10, p4y);
       line(mouseX, p5y, sx, p5y);
       text("100.0", mouseX - 10, p5y);
     } else {
       float distance = sy - mouseY;
       float beginning = mouseY;
       float p1y = beginning + (distance * 0.236);
       float p2y = beginning + (distance * 0.382);
       float p3y = beginning + (distance * 0.618);
       float p4y = beginning + (distance * 0.786);
       float p5y = beginning + distance;
       line(sx, p1y, mouseX, p1y);
       text("23.6", sx - 10, p1y);
       line(sx, p2y, mouseX, p2y);
       text("38.2", sx - 10, p2y);
       line(sx, p3y, mouseX, p3y);
       text("61.8", sx - 10, p3y);
       line(sx, p4y, mouseX, p4y);
       text("78.6", sx - 10, p4y);
       line(sx, p5y, mouseX, p5y);
       text("100.0", sx - 10, p5y);
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
          //plotPoint(xcor,  (int) yAvgCor);
          dots.add(d);
          yAvgCor = 0;
        }
        xcor -= 6;
      }
    }
   }

}
