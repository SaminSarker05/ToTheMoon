public class Candle {
  private int candleWidth = 4;
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
  
  void display(int xcor) {
    float ycor = 1300 - getHeight();
   
    if (close >= open) {
      float height = (float) (close - open);
      float topWick = (float) (high - close);
      float bottomWick = (float) (open - low);
      
      fill (255, 255, 255);
      rect(xcor, ycor, candleWidth, height);
      
      line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
      line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
    } else if (close < open){
      float height = (float) (open - close);
      float topWick = (float) (high - open);
      float bottomWick = (float) (close-low);
      
      fill (0, 0, 0);
      rect(xcor, ycor, candleWidth, height);
 
      line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
      line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
    }
  }
  
  float getHeight(){
    if (close >= open) return (float) this.close;
    else return (float) this.open;
  }
}
