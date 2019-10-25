//Enemy Bullet class with data
class eBullet {
  float speed;
  //float tempSpeed = 45;
  Boolean Fired;
  float yPos;
  float xPos;
  float velocity;
  
  //Enemy bullet constructor
  eBullet() {
    xPos=eShip.exPos;
    yPos=eShip.eyPos;
    speed= -15;
    velocity = -2.5;
    Fired=true;
  }
  //method for what the enemy bullet looks like
  void eDisplay() {
    fill(#FFCD00);
    strokeWeight(1.2);
    stroke(#FFF7D8);
    ellipse(xPos, yPos-45, 6, 18);
  }
  
  //mehtod for how the enemy bullet shoots
  void eShot() {
    if (Fired==true) {
      yPos+=speed;
      speed+=velocity;

    } else {
      Fired=false;
    }
  }
}
