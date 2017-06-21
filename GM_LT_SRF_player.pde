/* ----------------------------------------------------------- *\
 PLAYER
 \* ----------------------------------------------------------- */


class gameLayout_PLAYER {
  int ID;
  int type;
  int direction;
  int positionX;
  int positionY;
  int moving;

  String name;

  PImage[] skin;

  /* --- *\
   CONSTRUCTOR                   
   \* --- */

  public gameLayout_PLAYER (int tp) {
    type = tp;
    skin = loadSkin();
  }

  /* --- *\
   DISPLAY                   
   \* --- */

  void display() {
    imageMode(CENTER);

    pushMatrix();
    translate(0, 0, indexZ);
    image(skin[direction], positionX, positionY, 32, 32);
    popMatrix();

    imageMode(CORNER);
  }

  /* --- *\
   DISPLAY                   
   \* --- */

  void display(PGraphics GM) {
    checkDirections();
    GM.imageMode(CENTER);
    GM.pushMatrix();
    GM.translate(0, 0, indexZ);
    GM.fill(255, 255, 255, 100);
    GM.ellipseMode(CENTER);
    GM.ellipse(positionX, positionY, 32, 32);
    
    if (moving == RIGHT) {
      GM.scale(-1, 1);
      GM.image(skin[direction], -(positionX), positionY, 32, 32);
    } else {
      GM.image(skin[direction], positionX, positionY, 32, 32);
    }

    GM.popMatrix();
    GM.imageMode(CORNER);
  }

  /* --- *\
   MOVER                  
   \* --- */

  void move(int dir) {
    if (canGo(dir)) {
      moving = dir;

      switch(dir) {
      case UP:
        gameLayoutPosY+=moveSpeed;
        directTexture(dir);
        break;

      case DOWN:
        gameLayoutPosY-=moveSpeed;
        directTexture(dir);
        break;

      case LEFT:
        gameLayoutPosX+=moveSpeed;
        directTexture(dir);
        break;

      case RIGHT:
        gameLayoutPosX-=moveSpeed;
        directTexture(dir);
        break;
      }
    }

    gL.isBarrier();
  }
  boolean notSolid(int dir) {
    switch(dir) {
    }
    return false;
  }
  void directTexture(int dir) {
    switch(dir) {
    case UP:
      direction = 1;
      break;

    case DOWN:
      direction = 0;
      break;

    case LEFT:
      direction = 2;
      break;

    case RIGHT:
      direction = 2;
      break;
    }
  }

  /* --- *\
   POS SETTER                  
   \* --- */

  void setPositions(int x, int y) {
    positionX = x;
    positionY = y;
  }

  /* --- *\
   DIR CHECKER                   
   \* --- */

  void checkDirections() {

    /*if(keys[0]){
     if(gL.playerCanGo(UP)){
     direction = 1;
     }
     }
     if(keys[1]){
     if(gL.playerCanGo(DOWN)){
     direction = 0;
     }
     }
     if(keys[2]){
     if(gL.playerCanGo(LEFT)){
     direction = 2;
     }
     }
     if(keys[3]){
     if(gL.playerCanGo(RIGHT)){
     direction = 3;
     }  
     }*/
  }

  PImage[] loadSkin() {
    PImage [] txts = getSkinTextureById(type);
    PImage [] output = new PImage[4];
    int rnd = int(random(0, 3))*4;
    for (int i = 0; i < 4; i++) {
      output[i] = txts[i+rnd];
      //println("making picture :"+i+", on position: "+(i+rnd)+",random factor: "+rnd);
    }

    return output;
  }

  boolean canGo(int a) {
    switch(a) {
    case UP:
      return positionY-16 > gameLayoutPosY                         && !dirs[0];

    case DOWN:
      return positionY+16 < gameLayoutPosY  +  gL.getMapHeight()   && !dirs[1];

    case LEFT:
      return positionX-16 > gameLayoutPosX                         && !dirs[2];

    case RIGHT:
      return positionX+16 < gameLayoutPosX  +  gL.getMapWidth()    && !dirs[3];

    default:
      return false;
    }
  }
}