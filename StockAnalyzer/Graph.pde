BufferedReader reader;
String line;

public class Graph {
  public ArrayList<Candle> Candles = new ArrayList<Candle>();
  private ArrayList<String> dates = new ArrayList<String>();
  private ArrayList<Dot> dots = new ArrayList<Dot>();

  private String ticker;
  int dateYCor = 40;
  int dateXCor = 990;

  public Graph(){}
  
  void start(String ticker) {  
    fill(200);
    rect(60.0, 40.0, 1080.0, 680.0);
    
    int xcor = 1080;
    retrieve();
    double yAvgCor = 0;
    for (int i = 0; i < Candles.size(); i++){
      Candles.get(i).display(xcor,  1300 - (int) Candles.get(i).getHeight());
      
      if (i + 20 < Candles.size()){
        for (int j = i; j < i + 20; j++) {
          yAvgCor += Candles.get(j).getHeight();
        }
        yAvgCor /= 20;
        Dot d = new Dot(xcor, 1300 - (int) yAvgCor);
        dots.add(d);
        yAvgCor = 0;
      }
      xcor -= 6;
    }
  }
  
  void retrieve() {
    String[] lines = loadStrings("TSLA.csv");
    for (int i = lines.length-1 ; i >= 0; i--) {
      String[] data = lines[i].split(",");
      float open = Float.parseFloat(data[1]);
      float high = Float.parseFloat(data[2]);
      float low = Float.parseFloat(data[3]);
      float close = Float.parseFloat(data[4]);
      String date = data[0];
      Candle temp = new Candle(high, low, open, close);
      Candles.add(temp);
      dates.add(date);
    } 
  }
  
  void buildYAxis(int shift) {
   this.dateYCor += shift;
   int high = (int) findHighestHigh();
   high = Math.round(high/10.0) * 10; 
   int ycor = dateYCor;
   for (int i = high; i >= 0; i-= 40){
     int colour = 0;
     if (ycor < 70 || ycor > 700){
       colour = 255;
     }
     fill(colour);
     text(i, 1150, ycor);
     ycor += 42;
   }
   ycor = dateYCor;
   for (int i = high; i <= 10000; i+= 40){
     int colour = 0;
     if (ycor < 70 || ycor > 700){
       colour = 255;
     }
     fill(colour);
     text(i, 1150, ycor);
     ycor -= 42;
   }
  }
  
  void buildXAxis(int shift) {
   this.dateXCor += shift;
   int xcor = dateXCor;
   for (int i = 0; i < dates.size() ; i+=20) {
     pushMatrix();
     float angle1 = radians(270);
     translate(100, 180);
     rotate(angle1);
     textSize(9);
     int colour = 0;
     if (xcor < -32 || xcor > 1040){
       colour = 255;
     }
     fill(colour);
     text(dates.get(i), -560, xcor);
     popMatrix();
     xcor -= 120;
    }
  }
  
  double findHighestHigh(){
    double high = 0;
    for (int i = 0; i < Candles.size(); i++){
      if (Candles.get(i).getHigh() > high) {
        high = Candles.get(i).getHigh();
      }
    }
    return high;
  }
 
    
  void shiftCandles(int dirX, int dirY) {
    background(255);
    fill(200);
    stroke(255);
    rect(60.0, 40.0, 1080.0, 680.0);
    
    for (int i = 0; i < Candles.size(); i++){
      int currentX = Candles.get(i).getXCor();
      int currentY = Candles.get(i).getYCor();
      Candles.get(i).display((int) currentX + dirX, currentY + dirY);
    }
  }
  
  void shiftCandlesAndPoints(int dirX, int dirY) {
    background(255);
    fill(200);
    stroke(255);
    rect(60.0, 40.0, 1080.0, 680.0);
    
    for (int i = 0; i < Candles.size(); i++){
      int currentX = Candles.get(i).getXCor();
      int currentY = Candles.get(i).getYCor();
      Candles.get(i).display((int) currentX + dirX, currentY + dirY);
    }
    
    for (int i = 0; i < dots.size(); i++){
      int currentX = dots.get(i).getX();
      int currentY = dots.get(i).getY();
      dots.get(i).plotPoint(currentX + dirX,  currentY + dirY);
    }
    
    for (int i = 0; i < dots.size()-1; i++) {
      stroke(82,158,255);
      strokeWeight(0.5);
      if (dots.get(i).getX() > 60 && dots.get(i).getX() < 1140 && dots.get(i).getY() > 40 && dots.get(i).getY() < 720) {
        line(dots.get(i).getX(),   dots.get(i).getY(),   dots.get(i+1).getX(),   dots.get(i+1).getY());
      }
    }
  }
  
  ArrayList<Candle> getCandles() {
    return Candles;
  }
  
}
