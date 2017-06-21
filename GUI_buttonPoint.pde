/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////                                           /////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////


class button_point {
  int ID;

  int speed = 20;

  int positionX;
  int positionY;

  int defPosX;
  int defPosY;

  int movement;

  int sizeX = 200;
  int sizeY = 30;

  public button_point(int tid, int x, int y) {
    ID = tid;
    positionX = x;
    positionY = y;

    defPosX = x;
    defPosY = y;
  }
  void setSpeed(int a) {
    speed = a;
  }
  void setPosition(int x, int y) {
    positionX = x;
    positionY = y;

    defPosX = x;
    defPosY = y;
  }
  void display() {
    stroke(0, 255, 255, transLO);
    strokeWeight(5);

    switch(movement) {
    case 0:
      point(defPosX, defPosY);
      break;

    case 1:
      moveRIGHT();
      point(positionX, positionY);
      break;

    case 2:
      moveLEFT();
      point(positionX, positionY);
      break;
    } 
    strokeWeight(1);
    line(positionX, positionY, defPosX, defPosY);

    strokeWeight(1);
  }
  void moveLEFT() {
    if (positionX > defPosX-sizeX) {
      positionX -=speed;
    }
  }
  void moveRIGHT() {
    if (positionX < defPosX+sizeX) {
      positionX += speed;
    }
  }
}