BufferedReader reader;
String line;

public class Graph {
  private ArrayList<Candle> Candles = new ArrayList<Candle>();
  //private int[] prices;
  
  public Graph(){
  }
  
  void start() {
    fill(255);
    int xcor = 1200;
    retrieve();
    for (int i = 0; i < Candles.size(); i++){
      Candles.get(i).display(xcor);
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
      Candle temp = new Candle(high, low, open, close);
      Candles.add(temp);
    }
  }
    
  void shiftCandles(int dirX, int dirY) {
    //background(255);
    for (int i = 0; i < Candles.size(); i++){
      //int currentX = Candles.get(i).getXCor();
      //int currentY = Candles.get(i).getYCor();
      Candles.get(i).update(dirX, dirY);
    }
  }
}
