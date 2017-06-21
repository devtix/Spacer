class listItem {
  int ID;

  int posX;
  int posY;

  int sizeX;
  int sizeY;

  String worldName;
  String Mode;

  int scrl;

  boolean active;

  Date date = new Date();

  PImage icon;

  public listItem(int tID, String wn, String md, Date dt) {
    ID = tID;
    worldName = wn;
    Mode = md; 
    date = dt;
    sizeX = ((width/4)/cellSize)*cellSize;
    sizeY = 3*cellSize;

    posX = 0;
    posY = 0+(sizeY*ID);
  }

  boolean mouseOver() {
    return(  mouseX > posX+cellSize &&
      mouseX < posX+sizeX+cellSize&&
      mouseY > posY+(sizeY)+scrl &&
      mouseY < posY+(sizeY*2)+scrl);
  }

  void setActivity(boolean st) {
    active =st;
  }  

  public void display(int scroolY, PGraphics sWL) {
    if (mouseOver() && mousePressed) {
      SP.activeButton = ID;
    }

    if (SP.activeButton == ID) {
      active = true;
    } else {
      active = false;
    }

    scrl = scroolY;

    sWL.strokeWeight(1);
    sWL.stroke(255, 255, 255, 0);

    if (mouseOver()) {
      sWL.fill(0, 255, 255, 15);
    } else {
      sWL.fill(0, 255, 255, 10);
    }

    if (active) {
      sWL.fill(0, 255, 255, 20);
    }

    sWL.rect(posX, posY+scroolY, sizeX, sizeY);

    sWL.textSize(10);
    sWL.fill(100, 100, 100);
    sWL.textAlign(RIGHT);
    sWL.text(date.getDay()+"/"+date.getMonth()+"/"+date.getYear()+" "+date.getHours()+":"+date.getMinutes(), sizeX-cellSize-10, posY+sizeY-cellSize+cellSize/2-5+scroolY);

    sWL.fill(0, 255, 255);
    sWL.textAlign(LEFT);
    sWL.textSize(15);
    sWL.text(worldName.toUpperCase(), cellSize, posY+cellSize/2-5+scroolY);


    if (mouseOver()) {
      sWL.stroke(255, 200, 0);
    } else {
      sWL.stroke(255, 127, 0);
    }

    if (active) {
      sWL.stroke(255, 255, 0);
    }
    sWL.strokeWeight(8);
    sWL.point(sizeX-cellSize/2, posY+sizeY-cellSize/2+scroolY);

    sWL.strokeWeight(3);
    sWL.strokeCap(ROUND);

    sWL.line(cellSize/2, posY+sizeY-cellSize/2+scroolY, cellSize/2, posY+(cellSize/2)+scroolY);
  }
}