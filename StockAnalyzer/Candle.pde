int candleWidth = 16;

public class Candle {
  double high;
  double low; 
  double open;
  double close;
  
  public Candle(double high, double low, double open, double close) {
    this.high = high;
    this.low = low;
    this.open = open;
    this.close = close;
  }
  
  void display() {
    if (open > close) {
      float height = (float) (open - close);
      System.out.println(height);
      rect(100, 100, candleWidth, 100 - height);
      fill(0, 255, 0);
      float topWick = (float) (high - close);
      System.out.println(topWick);
      line(100 + candleWidth/2, 100 - topWick, 100 + candleWidth/2, 100);
      float bottomWick = (float) (open-low);
      System.out.println(bottomWick);
      line(100 + candleWidth/2, 100 + bottomWick, 100 + candleWidth/2, 100+ height);
      
    }
    
  }
  
}
