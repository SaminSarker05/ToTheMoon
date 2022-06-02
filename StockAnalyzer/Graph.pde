BufferedReader reader;
String line;

public class Graph {
  private ArrayList<Candle> Candles = new ArrayList<Candle>();
  private ArrayList<String> dates = new ArrayList<String>();
  int dateYCor = 40;
  int dateXCor = 1100;;

  public Graph(){
  }
  
  void start() {  
    fill(200);
    rect(40.0, 40.0, 1100.0, 680.0);
    
    int xcor = 1100;
    retrieve();
    for (int i = 0; i < Candles.size(); i++){
      Candles.get(i).display(xcor,  1300 - (int) Candles.get(i).getHeight());
      xcor -= 5;
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
   int ycor = dateYCor;
   for (int i = high; i >= 0; i-= 40){
     fill(0);
     text(i, 1150, ycor);
     ycor += 42;
   }
  }
  
  void buildXAxis(int shift) {
   //this.dateYCor += shift;
   //int ycor = dateYCor;
   //for (int i = high; i >= 0; i-= 40){
   //  fill(0);
   //  text(i, 1150, ycor);
   //  ycor += 42;
   //}
   
   this.dateXCor += shift;
   int xcor = dateXCor;
   for (int i = dates.size()-1; i >= 0 ; i-=10){
      fill(0);
      textSize(6);
      //rotate(HALF_PI);
      text(dates.get(i), xcor, 600);
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
    rect(40.0, 40.0, 1100.0, 680.0);
    
    for (int i = 0; i < Candles.size(); i++){
      int currentX = Candles.get(i).getXCor();
      int currentY = Candles.get(i).getYCor();
      Candles.get(i).display((int) currentX + dirX, currentY + dirY);
    }
  }
}
