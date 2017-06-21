class map_tile {

  int tileSize;

  int id;
  int block_id;

  int positionX;
  int positionY;

  int posX;
  int posY;

  int centerPosX;
  int centerPosY;

  PImage texture;

  boolean colorized;
  boolean solid;

  /* ----------------------------------------------------------- *\
   BASIC CONSTRUCTOR
   \* ----------------------------------------------------------- */

  public map_tile() {
  }

  /* ----------------------------------------------------------- *\
   CONSTRUCTOR with params
   \* ----------------------------------------------------------- */

  public map_tile(int tid, int b_tid, int tpX, int tpY) {
    id        =   tid;
    block_id  = b_tid;

    texture   = getGroundTextureById(b_tid);

    tileSize  = texture.height;
    positionX = tpX * tileSize;
    positionY = tpY * tileSize;

    centerPosX = positionX+(tileSize/2);
    centerPosY = positionY+(tileSize/2);

    if (block_id > 5) {
      solid = true;
    }
  }

  /* ----------------------------------------------------------- *\
   DISPLAY with GM
   \* ----------------------------------------------------------- */

  void display(PGraphics GM) {
    posX = positionX + gameLayoutPosX;
    posY = positionY + gameLayoutPosY;

    centerPosX = posX+(tileSize/2);
    centerPosY = posY+(tileSize/2);

    GM.pushMatrix();
    GM.translate(0, 0, indexZ);

    if (mouseOver()) {
      if (solid) {
        GM.tint(125, 125, 255);
      } else {
        GM.tint(255, 125, 125);
      }
    } else {
      GM.tint(255);
    }

    GM.image(texture, posX, posY, 32, 32);

    if (mouseOver() || playerIsOver()) {
      GM.textAlign(CENTER);
      GM.text(id, posX+16, posY+16);

      if (playerIsOver()) {
        playerOverID = id;
      }
    }

    GM.tint(255);
    GM.popMatrix();
  }

  /* ----------------------------------------------------------- *\
   DISPLAY NORMALLY
   \* ----------------------------------------------------------- */

  void display() {
    posX = positionX + gameLayoutPosX;
    posY = positionY + gameLayoutPosY;

    try {
      image(texture, positionX, positionY, 32, 32);
    }
    catch(NullPointerException NPE) {
    }
  }

  /* ----------------------------------------------------------- *\
   IS SOLID ?
   \* ----------------------------------------------------------- */

  boolean isSolid() {
    return solid;
  }

  /* ----------------------------------------------------------- *\
   MOUSE OVER
   \* ----------------------------------------------------------- */

  boolean mouseOver() {

    return (   mouseX < posX  +  32 &&
      mouseX > posX        &&
      mouseY < posY  +  32 &&
      mouseY > posY
      );
  }

  /* ----------------------------------------------------------- *\
   PLAYER IS OVER
   \* ----------------------------------------------------------- */

  boolean playerIsOver() {
    return dist(centerPosX, centerPosY, width/2, height/2) < (tileSize/4+8);
  }

  /* ----------------------------------------------------------- *\
   PLAYER IS OVER solid
   \* ----------------------------------------------------------- */

  boolean playerIsNearSolid() {
    return (dist(centerPosX, centerPosY, width/2, height/2+4) < (tileSize/4+8));
  }

  /* ----------------------------------------------------------- *\
   SOMETHING IS OVER
   \* ----------------------------------------------------------- */

  boolean isOver(int pX, int pY) {
    return(   pX < posX + 32 &&
      pX > posX      && 
      pY < posY + 32 &&
      pY > posY
      );
  }

  /* ----------------------------------------------------------- *\
   SET COLORIZED
   \* ----------------------------------------------------------- */

  void colorizeMe() {
    colorized = true;
  }
}