class Enemy {
  color c;
  float xPos;
  float yPos;
  boolean eleft;
  boolean eright;
  Enemy() {
    c=(#FF0303);
    yPos=100;
    xPos=random(100, 800);
    eleft=false;
    eright=false;
  }
  void eDisplay() {
    if (eleft) {
      xPos=xPos - 4;
    }
    if (eright) {
      xPos=xPos + 4;
    } 
    fill(c);
    stroke(c);
    beginShape(); 
    vertex(xPos-10, yPos+10);
    vertex(xPos, yPos+15);
    vertex(xPos+10, yPos+10);
    vertex(xPos, yPos+40);
    endShape(CLOSE);
    loop();

    if (yPos>250) {
      yPos=250;
    }
    if (xPos>800) {
      xPos=800;
    }
    if (yPos<100) {
      yPos=100;
    }
    if (xPos<100) {
      xPos=100;
    }
  }
  void eMove(float tXPos) {
    xPos += .018*(tXPos-xPos);
  }
  void eShoot() {
int i=0;
    while (i<1) {
      i++;
      eBullet.add(new eBullet());
      break;
    }
  }
}
