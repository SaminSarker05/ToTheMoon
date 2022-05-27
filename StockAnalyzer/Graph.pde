BufferedReader reader;
String line;

public class Graph {
  private ArrayList<Candle> Candles = new ArrayList<Candle>();
  //private int[] prices;
  
  public Graph(){
    fill(24, 46, 61);
    rect(5.0, 5.0, 1015.0, 800.0);
    int xcor = 1010;
    retrieve();
    for (int i = 0; i < Candles.size(); i++){
      Candles.get(i).display(xcor);
      xcor -= 10;
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
}
