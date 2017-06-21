class progressBar {

  int positionX;
  int positionY;

  int sizeX;
  int sizeY;

  int percentage;
  int SizeOnePercent;

  public progressBar( int x, int y, int sx, int sy) {
    percentage = 0;
    positionX = x;
    positionY = y;

    sizeX = sx;
    sizeY = sy;

    SizeOnePercent = sizeX/100;
  }

  void setPercents(int prcnt) {
    percentage = prcnt;
  }

  void setPosition(int x, int y) {
    positionX = x;
    positionY = y;
  }

  void display(int mode) {
    rectMode(mode);
    fill(0, 255, 255, 5);
    stroke(0, 255, 255);

    if (mode == CENTER) {
      rect(positionX, positionY, sizeX, sizeY);
    } else {
      rect(positionX-sizeX/2, positionY-sizeY/2, sizeX, sizeY);
    }

    rectMode(CORNER);
    fill(0, 255, 255, 10);
    stroke(0, 255, 255, 0);
    rect(positionX-sizeX/2, positionY-sizeY/2, SizeOnePercent*percentage, sizeY);

    textAlign(CENTER);
    fill(0, 255, 255);
    text(percentage+" %", positionX, positionY+5);
    textAlign(LEFT);
  }
}