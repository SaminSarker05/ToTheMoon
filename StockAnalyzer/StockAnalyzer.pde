char mode;
String ticker;

void setup() {
  size(1000, 1000);
  background(255);
  
  Candle a = new Candle(155.0, 20.0, 70.0, 100.0);
  Candle b = new Candle(160.0, 20.0, 70.0, 60.0);
  Candle c = new Candle(140.0, 20.0, 50.0, 55.0);
  Candle d = new Candle(120.0, 20.0, 40.0, 45.0);
  Candle e = new Candle(100.0, 20.0, 80.0, 78.0);
  Candle f = new Candle(180.0, 20.0, 40.0, 42.0);
  Candle h = new Candle(120.0, 20.0, 90.0, 95.0);
  Candle i = new Candle(170.0, 20.0, 100.0, 90.0);
  a.display(25, a.getHigh());
  b.display(50, b.getHigh());
  c.display(75, c.getHigh());
  d.display(100, d.getHigh());
  e.display(125, e.getHigh());
  f.display(150, f.getHigh());
  h.display(175, h.getHigh());
  i.display(200, i.getHigh());
  
  
}

void draw() {

}
