class eBullet {
  float speed;
  //float tempSpeed = 45;
  Boolean Fired;
  eBullet() {
  }
  void bulletFiredE() { 
    fill(#FFCD00);
    strokeWeight(1.2);
    stroke(#FFF7D8);
    ellipse(eShip.xPos, speed, 6, 18);
    Fired=false;
    if (Fired=false);
    {
      speed= speed+20;
    }
  }
}
