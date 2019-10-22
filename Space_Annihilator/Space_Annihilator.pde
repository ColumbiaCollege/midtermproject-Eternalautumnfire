//Objects
// 26 Sept 2019 Jeremiah Wilson

//Ship Object
Ship myShip;
Enemy eShip;
ArrayList<Bullet> pBullet = new ArrayList<Bullet>();
ArrayList<eBullet> eBullet = new ArrayList<eBullet>();
int numberofstars = 45;
Star[] Stars = new Star[numberofstars];


//sets up window and initalizes object
void setup() {
  size(900, 600);
  for (int i =0; i < numberofstars; i++) {
    Stars[i] = new Star();
  }
  myShip=new Ship();
  //for (int i=0; i<15; i++) {
  //  pBullet.add(new Bullet());
  //}
  eShip = new Enemy();
  //pBullet = new Bullet();
}


void draw() {
  background(0);
  //calls methods the object uses
  for (int i=0; i<Stars.length; i++) {
    Stars[i].StarDraw();
    Stars[i].StarMove();
  }
  //myShip.move();
  //myShip.keyPressed();
  //myShip.keyReleased();
  myShip.display();
  myShip.Shoot();
  for (Bullet b : pBullet) {
    pBullet.get(0);
    {
      b.bulletFiredP();
    }
  }
  eShip.eDisplay();
  eShip.eMove(myShip.xPos);
  eShip.eShoot();
  for ( eBullet e : eBullet) {
    e.bulletFiredE();
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
}
