char mode;
String ticker;

void setup() {
  size(1000, 800);
  background(255);
  //                    high low open close
  Candle a = new Candle(155.0, 20.0, 70.0, 100.0);
  Candle b = new Candle(160.0, 20.0, 70.0, 60.0);
  Candle c = new Candle(140.0, 20.0, 50.0, 55.0);
  Candle d = new Candle(120.0, 10.0, 40.0, 90.0);
  Candle e = new Candle(100.0, 60.0, 80.0, 65.0);
  Candle f = new Candle(180.0, 20.0, 40.0, 80.0);
  Candle h = new Candle(180.0, 25.0, 90.0, 95.0);
  Candle i = new Candle(100.0, 10.0, 100.0, 90.0);
  a.display(25, 400 - a.getHeight());
  b.display(50, 400 -b.getHeight());
  c.display(75, 400 - c.getHeight());
  d.display(100, 400 -d.getHeight());
  e.display(125, 400 -e.getHeight());
  f.display(150, 400 -f.getHeight());
  h.display(175, 400 -h.getHeight());
  i.display(200, 400 -i.getHeight());
}

void draw() {

}
