class Candle {
  double high;
  double low; 
  double open;
  double close;
  
  public Candle(double top, double bottom, double op, double cl) {
    high = top;
    low = bottom;
    open = op;
    close = cl;
    
  }
  
  void display() {
    if (open > close) {
      int height = (int) (open - close);
      rect(100, 100, 25, 100 - height);
      fill(0, 255, 0);
    }
    
  }
  
}
