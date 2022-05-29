public class Candle {
  private float candleWidth = 2;
  private double high;
  private double low; 
  private double open;
  private double close;
  private float xcor;
  private float ycor;
  
  public Candle(double high, double low, double open, double close) {
    this.high = high;
    this.low = low;
    this.open = open;
    this.close = close;
  }
  
  void display(int xCor) {
    this.xcor = xCor;
    this.ycor = 1300 - getHeight();

    if (close >= open) {
      float height = (float) (close - open);
      float topWick = (float) (high - close);
      float bottomWick = (float) (open - low);
      
      stroke(0);
      fill(255);
      rect(xcor, ycor, candleWidth, height);
      
      line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
      line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
    } else if (close < open){
      float height = (float) (open - close);
      float topWick = (float) (high - open);
      float bottomWick = (float) (close-low);
      
      stroke(0);
      fill(0);
      rect(xcor, ycor, candleWidth, height);
     
      line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
      line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
    }
  }
  
  float getHeight(){
    if (close >= open) return (float) this.close;
    else return (float) this.open;
  }
  
  int getXCor(){
    return (int) this.xcor;
  }
  
  //void setX (float x){
  //  this.xcor = x;
  //}
  
  //void setY (float y){
  //  this.ycor = y;
  //}
  
  void update(int X, int Y) {
    this.xcor += X;
    this.ycor += Y;
  }
  
  int getYCor(){
    return (int) this.ycor;
  }
}
