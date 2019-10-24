class Enemy {
  color c;
  float exPos;
  float eyPos;
  boolean shoot;
  boolean death;
  int f;
  float speed;

  Enemy() {
    c=(#FF0303);
    eyPos=500;
    exPos=random(100, 800);
    shoot=false;
    death=false;
    speed = -1.5;
  }
  void eDisplay() {
    fill(c);
    stroke(c);
    beginShape(); 
    vertex(exPos-10, eyPos-10);
    vertex(exPos, eyPos-15);
    vertex(exPos+10, eyPos-10);
    vertex(exPos, eyPos-40);
    endShape(CLOSE);
    loop();

    if (eyPos>height) {
      eyPos=0;
    }
    if (exPos>800) {
      exPos=800;
    }
    //if (eyPos<100) {
    //  eyPos=100;
    //}
    if (exPos<100) {
      exPos=100;
    }
  }
  void eMove(float tXPos) {
    eyPos = eyPos-speed;
    if (eyPos>myShip.yPos) {
      exPos += .055*(tXPos-exPos);
    } 
    if (exPos==myShip.xPos+0.2) {
      exPos -= -3;
    } else {
      if (exPos==myShip.xPos-0.2) {
        exPos -= 3;
      }
      if (eyPos<myShip.yPos||exPos<50||exPos>850) {
        exPos -= .025*(tXPos-exPos+25);
      }
    }
  }
  void eShoot() {
    if (exPos<=myShip.xPos+50d&exPos>=myShip.xPos-50&eyPos>myShip.yPos+20) {
      shoot=true;
      {
        if (shoot==true) {
          //for (f = 0; f<0; f++) {
          //  f=f%13;
          //  if (f>0) {
          eBullet.add(new eBullet());
        }
      }
    }
  }
  //}
  //}
  void Death() {
    if (EnemyHit(exPos, eyPos)==true) {
      death = true;
    } else { 
      death = false;
    }
  }
}
