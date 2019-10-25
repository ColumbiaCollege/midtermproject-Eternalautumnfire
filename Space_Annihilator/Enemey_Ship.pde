/* Enemy Ship class with things the enemy can do.
 i.e. the Enemy's color, position, checks for shooting or dying, etc.
 */
class Enemy {
  color c;
  float exPos;
  float eyPos;
  boolean shoot;
  boolean death;
  int f;
  float speed;
  boolean chase;
  boolean dodge;
  
  //The enemy object where the things it can do are initialized, and the enemy "Spawns" at a random spot
  Enemy() {
    c=(#FF0303);
    eyPos=500;
    exPos=random(100, 800)-myShip.xPos;
    shoot=false;
    death=false;
    speed=1.5;
  }
  
  // What the enemy looks like and where it can move
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

    if (eyPos>600) {
      chase=false;
      eyPos=600;
    }
    if (exPos>850) {
      exPos=850;
    }
    if (eyPos<50) {
      chase=true;
      eyPos=50;
    }
    if (exPos<50) {
      exPos=50;
    }
  }
  // how the enemy moves depending on its position related to the player's position
  void eMove(float tXPos) {
    if (eShip.eyPos<myShip.yPos) {
      dodge=true;
    } else {
      dodge=false;
    }
    if (chase==false) {
      eyPos = eyPos-speed;
    }
    if (eyPos>myShip.yPos) {
      exPos += .055*(tXPos-exPos);
    }      
    if (dodge==true) {
      exPos -= .025*(tXPos-exPos+25);
      if (exPos==myShip.xPos|exPos==myShip.xPos+5) {
        exPos -= 3;
      }
      if (exPos==myShip.xPos|exPos==myShip.xPos-5) {
        exPos += +6;
      }
    } else {
      dodge=false;
    } 
    if (chase==true) {
      dodge=false;
      eyPos = eyPos+speed;
      if (eyPos<myShip.yPos||exPos<60||exPos>850) {
        exPos -= .025*(tXPos-exPos+25);
      }
    }
  }

  // How the enemy fires in relation to where it is and where the player is. Also utilizes Rate of Fire.
  void eShoot() {
    if (exPos<=myShip.xPos+50d&exPos>=myShip.xPos-50&eyPos>myShip.yPos+20) {
      RoF++;
      if (RoF%13==0) {
        shoot=true;
      } else {
        shoot=false;
      }
      if (shoot==true) {
        eBullet.add(new eBullet());
      }
    }
  }
}
