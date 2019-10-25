
/* Class for creating the Player Bullet object. Class contains data related to a Bullet
 i.e. Speed at which bullet will fly, it's position, velocity, etc.
 */
class Bullet {
  float speed;
  //float tempSpeed = 45;
  Boolean Fired;
  float yPos;
  float xPos;
  float velocity;
  
  // The Bullet Object where it's data is initialized
  Bullet() {
    xPos=myShip.xPos;
    yPos=myShip.yPos;
    speed=-15;
    velocity = -2.5;
    Fired=true;
  }
  // What the bullet looks like
  void Display() {
    fill(#FFCD00);
    strokeWeight(1.2);
    stroke(#FFF7D8);
    ellipse(xPos, yPos-45, 6, 18);
  }
  // How the bullet acts when fired
  void Shot() {
    if (Fired==true) {
      yPos+=speed;
      speed+=velocity;
      //loop();
    } else {
      Fired=false;
    }
  }
}
