class Bullet {
  float speed;
  //float tempSpeed = 45;
  Boolean Fired;

  Bullet() {
  }
  void bulletFiredP() {
    int i=0;
    //while (i<1) {
    //  i++;
    fill(#FFCD00);
    strokeWeight(1.2);
    stroke(#FFF7D8);
    ellipse(myShip.xPos, speed+myShip.yPos-25, 6, 18);
    Fired=true;
    if (Fired=true) {
      speed=speed-5;
    } else {
      Fired=false;
    }
    //  break;
    //}
  }
}
