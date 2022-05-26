char mode;
String ticker;

void setup() {
  size(1000, 800);
  background(255);
}

void draw() {
  //                    high low open close
  Candle a = new Candle(155.0, 20.0, 70.0, 100.0);
  Candle c = new Candle(155.0, 20.0, 70.0, 60.0);
  a.display(100, 200);
  c.display(200, 200);
  

}
