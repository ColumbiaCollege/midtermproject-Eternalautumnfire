class Bullet {
  float speed;
  //float tempSpeed = 45;
  Boolean Fired;
float intXPos;
float intYPos;
  Bullet() {
    intXPos=myShip.xPos;
    intYPos=myShip.yPos;
  }
  void bulletFiredP() {
    fill(#FFCD00);
    strokeWeight(1.2);
    stroke(#FFF7D8);
    ellipse(intXPos, speed+intYPos-25, 6, 18);
    Fired=true;
    if (Fired=true) {
      speed=speed-15;
    } else {
      Fired=false;
    }
  }
}
