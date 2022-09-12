void setup() {
  size(500, 500);  //feel free to change the size
  noLoop(); //stops the draw() function from repeating
}
void draw() {
  System.out.print("Hello ");
  System.out.println("World");
  noFill();
  for (int y = 25; y >= 0; y--)
  for (int x = 0; x <= 500; x += 20)
    scale(y % 2 == 0 ? x : x + 10, 500 - 20 * y);
}
void scale(int x, int y) {
  bezier(x-10, y, x-10, y-10, x-5, y-10, x, y-20);
  bezier(x+10, y, x+10, y-10, x+5, y-10, x, y-20);
}
