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
    scales.add(java.util.Arrays.asList(x, y, (int)(Math.random()*5), 100+(int)(Math.random()*40)));
}

final float movespeed = 0.4;
int prevx = 0, prevy = 0;
void draw() {
  background(255);
  stroke(0);
  int cx = mouseX/5, cy = mouseY/5;
  if (prevx != cx) cx = (int)lerp(prevx, cx, movespeed);
  if (prevy != cy) cy = (int)lerp(prevy, cy, movespeed);
  prevx = cx;
  prevy = cy;
  pushMatrix();
  translate(cx, cy);
  Iterator<List<Integer>> it = scales.iterator();
  while (it.hasNext()) {
    List<Integer> args = it.next();
    drawScale(args.get(0), args.get(1), args.get(2), args.get(3));
  }
  popMatrix();
  pushMatrix();
  translate(cx*0.7, cy*0.7);
  fill(20, 20, 50, 50);
  noStroke();
  ellipse(250, 250, 50, 50);
  popMatrix();
}
void drawScale(int x, int y, int randoffset, int randgreen) {
  fill(16, randgreen, 60);
  beginShape();
  vertex(x-10, y);
  bezierVertex(x-10 + randoffset, y-10, x-5 + randoffset, y-10, x, y-20);
  vertex(x, y-20);
  bezierVertex(x+5 - randoffset, y-10, x+10 - randoffset, y-10, x+10, y);
  endShape(CLOSE);
}
