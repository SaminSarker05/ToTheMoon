BufferedReader reader;
String line;

public class Graph {
  public ArrayList<Candle> Candles = new ArrayList<Candle>();
  private ArrayList<String> dates = new ArrayList<String>();
  private ArrayList<Dot> dots = new ArrayList<Dot>();
  private ArrayList<Dot> upper = new ArrayList<Dot>();
  private ArrayList<Dot> lower = new ArrayList<Dot>();
  private String ticker;
  private int scale;
  
  int dateYCor = 40;
  int dateXCor = 990;

  public Graph(){}
  
  void start(String ticker) {
    this.ticker = ticker.toUpperCase();
    
    fill(192,192,192);
    rect(60.0, 40.0, 1130.0, 695.0, 7);
    rect(5, 40, 50, 695, 6);
    stroke(255);
    line(5, 220, 55, 220 );
    
    stroke(0);
    rect(1195, 40, 200, 695, 6);
    
    int xcor = 1080;
    retrieve(this.ticker);
    double yAvgCor = 0;
    double sum = 0;
    double SD = 0;
    for (int i = 0; i < Candles.size(); i++){
      Candles.get(i).display(xcor,  1300 - (int) Candles.get(i).getHeight());
      
      if (i + 20 < Candles.size()){
        for (int j = i; j < i + 20; j++) {
          yAvgCor += Candles.get(j).getHeight();
        }
        yAvgCor /= 20;
        for (int j = i; j < i + 20; j++) {
            sum += (Candles.get(j).getHeight() - yAvgCor) * (Candles.get(j).getHeight() - yAvgCor);
        }
          
        SD = Math.pow(sum/20, 0.5);
        Dot du = new Dot(xcor, 1300- (int) (yAvgCor + SD));
        Dot dl = new Dot(xcor, 1300 -(int) (yAvgCor - SD));
        
        upper.add(du);
        lower.add(dl);
        
        Dot d = new Dot(xcor, 1300 - (int) yAvgCor);
        dots.add(d);
        yAvgCor = 0;
        sum = 0;
        SD = 0;
      }
      xcor -= 6;
    }
  }
  
  void retrieve(String ticker) {
    scale = 1;
    if (ticker.equals("TSLA")) scale = 1;
    if (ticker.equals("AAPL")) scale = 5;
    
    String[] lines = loadStrings(ticker + ".csv");
    for (int i = lines.length-1 ; i >= 0; i--) {
      String[] data = lines[i].split(",");
      float open = Float.parseFloat(data[1]);
      float high = Float.parseFloat(data[2]);
      float low = Float.parseFloat(data[3]);
      float close = Float.parseFloat(data[4]);
      String date = data[0];
      Candle temp = new Candle(high, low, open, close, scale);
      Candles.add(temp);
      dates.add(date);
    } 
  }
  
  void buildYAxis(int shift) {
    
    int scaleY = 0;
    int increment = 40;
    
    if (ticker.equals("AAPL")){
      scaleY = 380;
      increment = 10;
    }
    
   this.dateYCor += shift;
   int high = (int) findHighestHigh()/scale;
   high = Math.round(high/10.0) * 10; 
   int ycor = dateYCor + scaleY;
   for (int i = high; i >= 0; i-= increment){
     int colour = 0;
     if (ycor <= 70 || ycor >= 720){
       colour = 255;
     }
     fill(colour);
     text(i, 1150, ycor);
     ycor += 42;
   }
   ycor = dateYCor + scaleY;
   for (int i = high; i <= 10000; i+= increment){
     int colour = 0;
     if (ycor < 40 || ycor > 700){
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
     if (xcor < -33 && xcor > -90) {
       colour = 192;
     } else if (xcor < -30 || xcor > 1040){
       colour = 255;
     }
     fill(colour);
     stroke(0.5);
     text(dates.get(i), -550, xcor);
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
    fill(192,192,192);
    stroke(0);
    rect(60.0, 40.0, 1130.0, 695.0, 7);
    rect(5, 40, 50, 695, 6);
    stroke(255);
    line(5, 220, 55, 220 );
    stroke(0);
    rect(1195, 40, 200, 695, 6);
    
    for (int i = 0; i < Candles.size(); i++){
      int currentX = Candles.get(i).getXCor();
      int currentY = Candles.get(i).getYCor();
      Candles.get(i).display((int) currentX + dirX, currentY + dirY);
    }
  }
  
  void shiftCandlesAndPoints(int dirX, int dirY) {
    background(192,192,192);
    fill(192,192,192);
    stroke(255);
    rect(60.0, 40.0, 1130.0, 680.0, 7);
    rect(5, 40, 50, 680, 6);
    stroke(255);
    line(5, 220, 55, 220 );
    stroke(0);
    rect(1195, 40, 200, 695, 6);
    
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
  
  void shiftCandlesAndPointsTwo(int dirX, int dirY) {
    background(192,192,192);
    fill(200);
    stroke(255);
    rect(60.0, 40.0, 1080.0, 680.0, 7);
    rect(5, 40, 50, 680, 6);
    stroke(255);
    line(5, 220, 55, 220 );
    stroke(0);
    rect(1195, 40, 200, 695, 6);
    
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
    for (int i = 0; i < lower.size(); i++){
      int currentX = lower.get(i).getX();
      int currentY = lower.get(i).getY();
      lower.get(i).plotPoint(currentX + dirX,  currentY + dirY);
    }
    for (int i = 0; i < upper.size(); i++){
      int currentX = upper.get(i).getX();
      int currentY = upper.get(i).getY();
      upper.get(i).plotPoint(currentX + dirX,  currentY + dirY);
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
