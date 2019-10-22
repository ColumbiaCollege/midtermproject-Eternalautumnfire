class Star {
  float y;
  float x;
  float speed;
  Star() {
    y = random (10, 590);
    x=random(10, 890);
    speed = -10;
  }
  void StarDraw() {
    fill(255);
    stroke(255);
    ellipse(x, y, random(1,8), random(1,8));
  }
  void StarMove() {
    y = y - speed;
    if (y>height) {
      y=0;
      x = random(width);
    }
  }
}
