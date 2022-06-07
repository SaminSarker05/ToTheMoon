BufferedReader reader;
String line;

public class Graph {
  private ArrayList<Candle> Candles = new ArrayList<Candle>();
  private ArrayList<String> dates = new ArrayList<String>();
  int dateYCor = 40;
  int dateXCor = 990;

  public Graph(){
  }
  
  void start() {  
    fill(200);
    rect(60.0, 40.0, 1080.0, 680.0);
    
    int xcor = 1080;
    retrieve();
    for (int i = 0; i < Candles.size(); i++){
      Candles.get(i).display(xcor,  1300 - (int) Candles.get(i).getHeight());
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
     fill(0);
     text(i, 1150, ycor);
     ycor += 42;
   }
   
   ycor = dateYCor;
   
   for (int i = high; i <= 10000; i+= 40){
     int colour = 0;
     //if (ycor < 70 || ycor > 600){
     //  colour = 255;
     //}
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
     textSize(10);
     text(dates.get(i), -550, xcor);
     line(100, 0, 150, 0);
     popMatrix();
     xcor -= 50;
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
}
