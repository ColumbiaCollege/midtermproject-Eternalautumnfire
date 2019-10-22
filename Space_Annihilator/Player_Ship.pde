// Creates the class "Ship"
class Ship {
  //data for the class
  color c;
  float xPos;
  float yPos;
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  boolean shoot;
  //int Bullets = 15;


  //Constructor for the Ship that initalizes the data
  Ship() {
    c = color(255);
    xPos =450;
    yPos=500;
    left=false;
    right=false;
    up=false;
    down=false;
    shoot=false;
  }
  //Function (method) for ship display and area of movement
  void display() {
    fill(c);
    stroke(c);
    if (left) {
      xPos=xPos - 3;
    }
    if (right) {
      xPos=xPos + 3;
    }
    if (up) {
      yPos=yPos - 3;
    }
    if (down) {
      yPos=yPos + 3;
    }
    beginShape(); 
    vertex(xPos-10, yPos-10);
    vertex(xPos, yPos-15);
    vertex(xPos+10, yPos-10);
    vertex(xPos, yPos-40);
    endShape(CLOSE);
    loop();
    if (yPos>550) {
      yPos=550;
    }
    if (xPos>800) {
      xPos=800;
    }
    if (yPos<500) {
      yPos=500;
    }
    if (xPos<100) {
      xPos=100;
    }
  }
  void Shoot() {
    if (keyPressed&&key==' ') {
      shoot=true;
      pBullet = new ArrayList<Bullet>();
      pBullet.add(new Bullet());
    } else {
      shoot=false;
    }
  }
}
