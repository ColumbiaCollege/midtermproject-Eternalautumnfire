class Bullet {
  float speed;
  //float tempSpeed = 45;
  Boolean Fired;
  float yPos;
  float xPos;
  float velocity;
  Bullet() {
    xPos=myShip.xPos;
    yPos=myShip.yPos;
    speed=-15;
    velocity = -2.5;
    Fired=true;
  }
  void Display() {
    fill(#FFCD00);
    strokeWeight(1.2);
    stroke(#FFF7D8);
    ellipse(xPos, yPos-45, 6, 18);
  }
  void Shot() {
    if (Fired==true) {
      yPos+=speed;
      speed+=velocity;
      loop();
    } else {
      Fired=false;
    }
  }
}
