public class Candle {
  private float candleWidth = 2;
  private double high;
  private double low; 
  private double open;
  private double close;
  private float xcor;
  private float ycor = 1200 - getHeight();
  
  public Candle(double high, double low, double open, double close) {
    this.high = high;
    this.low = low;
    this.open = open;
    this.close = close;
  }
  
  void display(int xCor, int yCor) {
    if (xCor > 1130 || xCor < 40 || yCor > 700 || yCor < 40){
      
      this.xcor = xCor;
      this.ycor = yCor;
    
      if (close >= open) {
        float height = (float) (close - open);
        float topWick = (float) (high - close);
        float bottomWick = (float) (open - low);
        
        stroke(255);
        fill(255);
        rect(xcor, ycor, candleWidth, height);
        
        line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
        line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
      } else if (close < open){
        float height = (float) (open - close);
        float topWick = (float) (high - open);
        float bottomWick = (float) (close-low);
        
        stroke(255);
        fill(255);
        rect(xcor, ycor, candleWidth, height);
       
        line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
        line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
      }
    
    } else {
    
      this.xcor = xCor;
      this.ycor = yCor;
    
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
  }
  
  float getHeight(){
    if (close >= open) return (float) this.close;
    else return (float) this.open;
  }
  
  int getXCor(){
    return (int) this.xcor;
  }
    
  int getYCor(){
    return (int) this.ycor;
  }
}
