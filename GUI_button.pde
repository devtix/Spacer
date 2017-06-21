/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////                                           /////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

class button {
  button_point bp1;
  button_point bp2;

  int positionX;
  int positionY;

  int sizeX;
  int sizeY;

  String text;
  int url;

  boolean pressed;
  boolean loaderneeded;
  boolean transneeded = true;

  public button(int x, int y) {
    sizeX = 200;
    sizeY = 30;

    positionX = x;
    positionY = y;

    text = "button";
    text = text.toUpperCase();

    bp1 = new button_point(1, positionX-sizeX/2, positionY-sizeY/2);
    bp2 = new button_point(2, positionX+sizeX/2, positionY+sizeY/2);

    bp1.setSpeed(sizeX/12);
    bp2.setSpeed(sizeX/12);
  }

  public button(String txt, int x, int y, int sx, int sy) {
    sizeX = sx;
    sizeY = sy;

    positionX = x;
    positionY = y;

    text = txt;
    text = text.toUpperCase();

    bp1 = new button_point(1, positionX-sizeX/2, positionY-sizeY/2);
    bp2 = new button_point(2, positionX+sizeX/2, positionY+sizeY/2);
  }

  public button(String txt, int x, int y) {
    sizeX = 200;
    sizeY = 30;

    positionX = x;
    positionY = y;

    text = txt;
    text = text.toUpperCase();

    bp1 = new button_point(1, positionX-sizeX/2, positionY-sizeY/2);
    bp2 = new button_point(2, positionX+sizeX/2, positionY+sizeY/2);
  }

  void setURL(int a) {
    url = a;
  }

  void setPosition(int x, int y) {
    positionX = x;
    positionY = y;

    bp1.setPosition(x-sizeX/2, y-sizeY/2);
    bp2.setPosition(x+sizeX/2, y+sizeY/2);
  }
  void display() {

    fill(0, 255, 255, transL);
    stroke(0, 255, 255, transLO);
    strokeWeight(5);
    point(positionX-sizeX/2, positionY-sizeY/2);
    point(positionX+sizeX/2, positionY+sizeY/2);

    strokeWeight(1);
    stroke(0, 255, 255, transLO-105);
    line(positionX-sizeX/2, positionY-sizeY/2, positionX+sizeX/2, positionY-sizeY/2);

    line(positionX-sizeX/2, positionY+sizeY/2, positionX+sizeX/2, positionY+sizeY/2);

    if (mouseOver()) {
      bp1.movement = 1;
      bp2.movement = 2;

      if (bp2.positionX == bp1.defPosX) {
        fill(0, 255, 255, 10);
        rectMode(CENTER);
        rect(positionX, positionY, sizeX, sizeY);
      }
    } else {
      if (bp1.positionX == bp1.defPosX) {
        bp1.movement = 0;
      } else {
        bp1.movement = 2;
      }
      if (bp2.positionX == bp2.defPosX) {
        bp2.movement = 0;
      } else {
        bp2.movement = 1;
      }
    }

    bp1.display();
    bp2.display();

    if (mousePressed && mouseOver()) {
      if (bp2.positionX == bp1.defPosX) {
        fill(0, 255, 255, 30);
        rectMode(CENTER);
        rect(positionX, positionY, sizeX, sizeY);

        //actualLayout = url;
      }
      if (transneeded) {
        transitioning = true;
      }
      pressed = true;
    }

    fill(0, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text(text, positionX, positionY+6);
    textSize(10);



    if (pressed) {
      pressed = wATrans_IfTrans(url, loaderneeded);
    }
  }

  void setLoaderNeedeability(boolean a) {
    loaderneeded = a;
  }
  void setTransitionNeedeability(boolean a) {
    transneeded = a;
  }
  void setText(String tx) {
    text = tx;
  }

  boolean mouseOver() {
    return (
      mouseX > positionX-sizeX/2 &&
      mouseX < positionX+sizeX/2 &&
      mouseY > positionY-sizeY/2 &&
      mouseY < positionY+sizeY/2 
      );
  }
}