//Objects
// 26 Sept 2019 Jeremiah Wilson

//Ship Object
Ship myShip;
Enemy eShip;
ArrayList<Bullet> pBullet = new ArrayList<Bullet>();
ArrayList<eBullet> eBullet = new ArrayList<eBullet>();
int numberofstars = 45;
Star[] Stars = new Star[numberofstars];
Boolean SpentBullet(float bulletYpos) {
  if (bulletYpos<0) {
    return true;
  } else {
    return false;
  }
}
Boolean SpentEBullet(float bulletYpos) {
  if (bulletYpos<0) {
    return true;
  } else {
    return false;
  }
}
Boolean PlayerHit(float bulletXPos, float bulletYPos) {
  if (bulletXPos==myShip.xPos&&bulletYPos==myShip.yPos) {
    return true;
  } else {
    return false;
  }
}
Boolean EnemyHit(float bulletXPos, float bulletYPos) {
  if (bulletXPos==eShip.exPos&&bulletYPos==eShip.eyPos) {
    return true;
  } else {
    return false;
  }
}
//sets up window and initalizes object
void setup() {
  size(900, 600);
  for (int i =0; i < numberofstars; i++) {
    Stars[i] = new Star();
  }
  myShip = new Ship();
  eShip = new Enemy();
}


void draw() {
  background(0);
  //calls methods the object uses
  for (int i=0; i<Stars.length; i++) {
    Stars[i].StarDraw();
    Stars[i].StarMove();
  }
  if (myShip.death==true) {
    noLoop();
  }
  myShip.display();
  for (int i=0; i< pBullet.size(); i++) {
    Bullet b=pBullet.get(i);
    if (EnemyHit(b.xPos, b.yPos)) {
      eBullet.remove(i);
    }
    if (SpentBullet(b.yPos)) {
      pBullet.remove(i);
    }
    b.Display();
    b.Shot();
  }
  if (eShip.death==true) {
    noLoop();
  }
  eShip.eDisplay();
  eShip.eMove(myShip.xPos);
  eShip.eShoot();
  //println(eShip.shoot);
  for (int i=0; i< eBullet.size(); i++) {
    eBullet e=eBullet.get(i);
    if (PlayerHit(e.xPos, e.yPos)) {
      eBullet.remove(i);
    }
    if (SpentEBullet(e.yPos)) {
      eBullet.remove(i);
    }
    e.eDisplay();
    e.eShot();
  }
}

void keyPressed() {
  if (key=='w') {
    myShip.up=true;
    //down=false;
    //right=false;
    //left=false;
  }
  if (key=='s') {
    myShip.down=true;
    //up=false;
    //right=false;
    //left=false;
  }
  if (key=='a') {
    myShip.left=true;
    //right=false;
    //up=false;
    //down=false;
  }
  if (key=='d') {
    myShip.right=true;
    //left=false;
    //up=false;
    //down=false;
  }
}
void keyReleased() {
  if (key=='w') {
    myShip.up=false;
  }
  if (key=='s') {
    myShip.down=false;
  }
  if (key=='a') {
    myShip.left=false;
  }
  if (key=='d') {
    myShip.right=false;
  }
  if (key==' ') {
    pBullet.add(new Bullet());
  }
}
