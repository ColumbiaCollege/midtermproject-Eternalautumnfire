//Space Annihilator
// 26 Sept 2019 Jeremiah Wilson

//set Player Ship classt
Ship myShip;

//set Enemy Ship class
Enemy eShip;

//Variable for ending the game
boolean GameOver;

// Variable for setting enemy Rate of Fire
int RoF;

//Creates new Array Lists for Player and Enemy Bullets
ArrayList<Bullet> pBullet = new ArrayList<Bullet>();
ArrayList<eBullet> eBullet = new ArrayList<eBullet>();

//Sets number of stars to draw and creates and array ready to produce Star Objects from the Star Class
int numberofstars = 45;
Star[] Stars = new Star[numberofstars];

//Variables for checking if Bullets exceed the play area, and if bullets collide with either player or enemy
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
  if (dist(bulletXPos, bulletYPos, myShip.xPos, myShip.yPos)<20) {
    return true;
  } else {
    return false;
  }
}
Boolean EnemyHit(float ebulletX, float ebulletY) {
  if (dist(ebulletX, ebulletY, eShip.exPos, eShip.eyPos)<20) {
    return true;
  } else {
    return false;
  }
}

//sets up window and initalizes objects (Star, Player Ship and Enemy Ship)
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

  //loops the Star Objects to simulate the appearance of flying through space)
  for (int i=0; i<Stars.length; i++) {
    Stars[i].StarDraw();
    Stars[i].StarMove();
  }
  
  //Calls the display methods for both Player and Enemy
  myShip.display();
  eShip.eDisplay();
  
  //Calls the Enemy ship movement and shoot methods.
  eShip.eMove(myShip.xPos);
  eShip.eShoot();
  
  /*Adds bullets to the Player's bullet array list and calls the display and shoot methods to "fire" at the enemy.
    Also removes the bullets in reverse order and checks if the player bullet hit the enemy.
    if the bullet hits the enemy, the enemy is destroyed and the player wins.
  */
  for (int i=0; i< pBullet.size(); i++) {
    Bullet b=pBullet.get(i);
    if (EnemyHit(b.xPos, b.yPos)) {
      pBullet.remove(i);
    }
    if (SpentBullet(b.yPos)) {
      pBullet.remove(i);
    }
    b.Display();
    b.Shot();
    if (EnemyHit(b.xPos, b.yPos)) {
      GameOver=true;
      if (GameOver==true) {
        noLoop();
        background(0);
        textAlign(CENTER);
        textSize(22);
        text("You Win!", width/2, height/2);
        textSize(18);
        text("Click mouse to restart.", width/2, (height/2)+75);
      }
    }
  }
  
  //Does the same thing as above only for the enemy. If player is hit, player is destroyed and gives Game Over.
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
    if (PlayerHit(e.xPos, e.yPos)) {
      GameOver=true;
      if (GameOver==true) {
        noLoop();
        //redraw();
        background(0);
        textAlign(CENTER);
        textSize(22);
        text("Game Over! \n You Lose!", width/2, height/2);
        textSize(18);
        text("Click mouse to restart.", width/2, (height/2)+75);
      } else {
        GameOver=false;
      }
    }
  }
}


// Player commands to initalize movement
void keyPressed() {
  if (key=='w') {
    myShip.up=true;
  }
  if (key=='s') {
    myShip.down=true;
  }
  if (key=='a') {
    myShip.left=true;
  }
  if (key=='d') {
    myShip.right=true;
  }
}
// Player commands to stop movement or Fire a bullet
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

// Restarts the game
void mouseClicked() {
  redraw();
  myShip = new Ship();
  eShip = new Enemy();
}
