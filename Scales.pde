import java.util.LinkedList;
import java.util.List;
import java.util.Iterator;

LinkedList<List<Integer>> scales = new LinkedList<List<Integer>>();
final int outset = 100;

void setup() {
  size(500, 500);  //feel free to change the size
  //noLoop(); //stops the draw() function from repeating
  frameRate(24);
  for (int y = -outset; y <= 500 + outset; y+=10)
  for (int x = -outset; x <= 500; x+=10)
    scales.add(java.util.Arrays.asList(y % 4 == 0 ? x : x + 10, y, (int)(Math.random()*5), 100+(int)(Math.random()*40)));
}


int prevx, prevy;
void draw() {
  background(255);
  pushMatrix();
  int cx = mouseX/5, cy = mouseY/5;
  if (prevx != cx || prevy != cy) {
    cx = (int)lerp(prevx, cx, 0.5f);
    cy = (int)lerp(prevy, cy, 0.5);
  }
  prevx = cx;
  prevy = cy;
  translate(cx, cy);
  Iterator<List<Integer>> it = scales.iterator();
  while (it.hasNext()) {
    List<Integer> args = it.next();
    scale(args.get(0), args.get(1), args.get(2), args.get(3));
  }
  popMatrix();
}
void scale(int x, int y, int randoffset, int randgreen) {
  fill(16, randgreen, 60);
  beginShape();
  vertex(x-10, y);
  bezierVertex(x-10 + randoffset, y-10, x-5 + randoffset, y-10, x, y-20);
  vertex(x, y-20);
  bezierVertex(x+5 - randoffset, y-10, x+10 - randoffset, y-10, x+10, y);
  endShape(CLOSE);
}
