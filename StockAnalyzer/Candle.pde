

public class Candle {
  private int candleWidth = 16;
  private boolean COLOR = true;
  private double high;
  private double low; 
  private double open;
  private double close;
  
  public Candle(double high, double low, double open, double close) {
    this.high = high;
    this.low = low;
    this.open = open;
    this.close = close;
  }
  
  void display(int xcor, int ycor) {
    if (close > open) {
      float height = (float) (close - open);
      rect(xcor, ycor, candleWidth, height);
      float topWick = (float) (high - close);
      line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
      float bottomWick = (float) (open-low);
      line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
    } 
    
    if (COLOR) fill(0,255,0);
    else fill (255, 0,0 );
  }
  
  float getHigh(){
    return (float) this.high;
  }
}
