public class Candle {
  private float candleWidth = 4;
  private double high;
  private double low; 
  private double open;
  private double close;
  private float xcor;
  private float ycor = 1200 - getHeight();
  
  public Candle(double high, double low, double open, double close, float scale) {
    this.high = high * scale;
    this.low = low * scale;
    this.open = open * scale;
    this.close = close * scale;
  }
  
  void display(int xCor, int yCor) {
    if (xCor >= 5 && xCor <= 55 && yCor >= 40 && yCor <= 720) {
      this.xcor = xCor;
      this.ycor = yCor;
    
      if (close >= open) {
        float height = (float) (close - open) * 5;
        float topWick = (float) (high - close);
        float bottomWick = (float) (open - low);
        
        stroke(192,192,192);
        strokeWeight(1);
        fill(192,192,192);
        rect(xcor, ycor, candleWidth, height);
        
        line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
        line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
      } else if (close < open){
        float height = (float) (open - close) * 5;
        float topWick = (float) (high - open);
        float bottomWick = (float) (close-low);
        
        stroke(192,192,192);
        strokeWeight(1);
        fill(192,192,192);
        rect(xcor, ycor, candleWidth, height);
       
        line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
        line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
      }
      
    } else if (xCor >= 1140 || xCor <= 60 || yCor >= 700 || yCor <= 40){
      
      this.xcor = xCor;
      this.ycor = yCor;
    
      if (close >= open) {
        float height = (float) (close - open);
        float topWick = (float) (high - close);
        float bottomWick = (float) (open - low);
        
        stroke(255);
        strokeWeight(1);
        fill(255);
        rect(xcor, ycor, candleWidth, height);
        
        line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
        line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
      } else if (close < open){
        float height = (float) (open - close);
        float topWick = (float) (high - open);
        float bottomWick = (float) (close-low);
        
        stroke(255);
        strokeWeight(1);
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
        strokeWeight(1);
        fill(0,206,209);
        rect(xcor, ycor, candleWidth, height);
        
        line(xcor + candleWidth/2, ycor - topWick, xcor + candleWidth/2, ycor);
        line(xcor + candleWidth/2, ycor + height , xcor + candleWidth/2, ycor  + height + bottomWick);
      } else if (close < open){
        float height = (float) (open - close);
        float topWick = (float) (high - open);
        float bottomWick = (float) (close-low);
        
        stroke(0);
        strokeWeight(1);
        fill(253, 238, 0);
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
  
  double getHigh(){
    return this.high;
  }
  
  double getClose(){
    return this.getClose();
  }
  
  void plotPoint(int xCor, int yCor){
    stroke(0);
    fill(0,0,255);
    circle(xCor, yCor, 1);
  }
}
