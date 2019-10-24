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
  boolean death;
  boolean shoot;
  float speed;
  //Constructor for the Ship that initalizes the data
  Ship() {
    c = color(255);
    xPos =450;
    yPos=350;
    left=false;
    right=false;
    up=false;
    down=false;
    death=false;
    shoot=false;
    speed = 4*1.5;
  }
  //Function (method) for ship display and area of movement
  void display() {
    fill(c);
    stroke(c);
    if (left) {
      xPos=xPos - speed;
    }
    if (right) {
      xPos=xPos + speed;
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
    if (yPos>500) {
      yPos=500;
    }
    if (xPos>850) {
      xPos=850;
    }
    if (yPos<50) {
      yPos=50;
    }
    if (xPos<50) {
      xPos=50;
    }
  }
  void Death() {
    if (PlayerHit(xPos, yPos)==true) {
      death = true;
    } else { 
      death = false;
    }
  }
}
