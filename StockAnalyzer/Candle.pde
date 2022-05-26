public class Candle {
  private int candleWidth = 16;
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
  
  void display(int xcor, float ycor) {
    if (close > open) {
      float height = (float) (close - open);
      fill (0, 255, 0);
      rect(xcor, ycor, candleWidth, height);
      System.out.println("green");
      float topWick = (float) (high - close);
      line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
      float bottomWick = (float) (open-low);
      line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
    } else {
      float height = (float) (open - close);
      fill (255, 0, 0);
      rect(xcor, ycor, candleWidth, height);
      System.out.println("red");
      float topWick = (float) (high - open);
      line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
      float bottomWick = (float) (close-low);
      line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
    }
    
  }
  
  float getHigh(){
    return (float) this.high;
  }
}
