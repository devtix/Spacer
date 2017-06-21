class dataFeed {
  int posX=5;
  int posY=height-cellSize;

  button update;
  button autoUpdate;

  progressBar down;
  progressBar inst;

  int sizeX = 300;
  int sizeY = 500;


  String nameOfUpdate;
  String dateOfUpdate;
  String versionOfUpdate;

  int numOfImprovements;
  int numOfNews;
  int numOfBugs;

  JSONObject feed;
  JSONArray news;

  public dataFeed() {
    posX = width/8-sizeX/2;
    posY = height-cellSize;

    update = new button("update", sizeX/2, posY-50, sizeX/2+10, 30);
    autoUpdate = new button("Read about features", sizeX/2, posY-100, sizeX-40, 30);

    down = new progressBar(sizeX/2, posY-50, sizeX/2+10, 30);
    inst = new progressBar(sizeX/2, posY-100, sizeX-40, 30);

    update.setTransitionNeedeability(false);
    autoUpdate.setTransitionNeedeability(false);
  }
  void loadDatas() {
    nameOfUpdate    = feed.getString("updateName");
    dateOfUpdate    = feed.getString("date");
    versionOfUpdate = feed.getString("NewestVersion");

    numOfImprovements = feed.getInt("imps");
    numOfNews = feed.getInt("news");
    numOfBugs = feed.getInt("bugs");
  }

  void display() {


    if (mouseOver()) {
      move(true);
    } else {
      move(false);
    }

    rectMode(CORNER);
    stroke(0, 255, 255);
    fill(0, 255, 255, 10);
    rect(posX, posY, sizeX, sizeY);

    if (CONECTIVITY) {
      stroke(0, 255, 255, 5);
      fill(0, 255, 255, 5);

      int rectoPX = posX+sizeX/2, 
        rectoPY = posY+sizeY/2-cellSize-cellSize/2, 
        rectoSX = sizeX-40, 
        rectoSY = sizeY/2;

      rectMode(CENTER);
      rect(rectoPX, rectoPY, rectoSX, rectoSY);


      fill(0, 255, 255);
      textSize(15);
      textAlign(CENTER);

      /*if (UPDATE) {
       if (appup.downloading) {
       
       down.setPercents(appup.getDownPercents());
       down.setPosition(posX+sizeX/2, posY+sizeY-cellSize-100);
       down.display(CORNER);
       
       textAlign(CENTER);
       text("DOWNLOADING", posX+sizeX/2, posY+cellSize/2+5);
       } else if (appup.installing) {
       
       inst.setPercents(appup.getInstPercents());
       inst.setPosition(posX+sizeX/2, posY+sizeY-cellSize-100);
       inst.display(CORNER);
       
       textAlign(CENTER);
       text("INSTALLING", posX+sizeX/2, posY+cellSize/2+5);
       } else if (appup.done) {
       textAlign(CENTER);
       text("UPDATE DONE", posX+sizeX/2, posY+cellSize/2+5);
       text("DONE ! Please restart the game", posX+sizeX/2, posY+sizeY-cellSize-100);
       } else {
       update.setPosition(posX+sizeX/2, posY+sizeY-cellSize-100);
       update.display();
       textSize(15);
       textAlign(CENTER);
       text("UPDATE AVAILABLE", posX+sizeX/2, posY+cellSize/2+5);
       }
       } else {
       textSize(15);
       textAlign(CENTER);
       text("UPDATE FEED", posX+sizeX/2, posY+cellSize/2+5);
       }
       */

      stroke(0, 255, 255, 5);

      fill(0, 255, 255);
      textAlign(CENTER);
      textSize(18);
      text(nameOfUpdate.toUpperCase(), rectoPX, rectoPY-rectoSY/2+25);

      textSize(15);

      String versionOR = version.replaceAll("ALPHA", "").replaceAll("v.", "");
      String versionUP= versionOfUpdate.replaceAll("ALPHA", "").replaceAll("v.", "");

      if (!versionOR.equals(versionUP)) {
        text(versionOR+"  ->  "+versionUP, rectoPX, rectoPY-rectoSY/2+65);
        autoUpdate.setPosition(posX+sizeX/2, posY+sizeY-cellSize-40);
        autoUpdate.display();
      } else {
        text(versionUP, rectoPX, rectoPY-rectoSY/2+65);
        autoUpdate.setPosition(posX+sizeX/2, posY+sizeY-cellSize-70);
        autoUpdate.display();
      }


      stroke(255, 255, 0);
      line(rectoPX-rectoSX/2+20, rectoPY-rectoSY/2+40, rectoPX+rectoSX/2-20, rectoPY-rectoSY/2+40);
      line(rectoPX-rectoSX/2+20, rectoPY-rectoSY/2+80, rectoPX+rectoSX/2-20, rectoPY-rectoSY/2+80);

      //line(rectoPX-rectoSX/2+20 ,rectoPY-rectoSY/2+90,rectoPX-rectoSX/2+20 ,rectoPY+rectoSY/2-30);



      int distY = int(dist(rectoPX-rectoSX/2+20, rectoPY-rectoSY/2+90, rectoPX-rectoSX/2+20, rectoPY+rectoSY/2-30));
      //println(distY);

      textSize(12);
      textAlign(LEFT);
      text("absolute news:  ", rectoPX-rectoSX/2+20, rectoPY-rectoSY/2+90+distY*0.25);
      text("improvements:   ", rectoPX-rectoSX/2+20, rectoPY-rectoSY/2+90+distY*0.50);
      text("repaired bugs:  ", rectoPX-rectoSX/2+20, rectoPY-rectoSY/2+90+distY*0.75);

      textAlign(RIGHT);
      text(numOfNews, rectoPX+rectoSX/2-20, rectoPY-rectoSY/2+90+distY*0.25);
      text(numOfImprovements, rectoPX+rectoSX/2-20, rectoPY-rectoSY/2+90+distY*0.50);
      text(numOfBugs, rectoPX+rectoSX/2-20, rectoPY-rectoSY/2+90+distY*0.75);

      textAlign(CENTER);
      fill(90, 90, 90);
      text(dateOfUpdate, rectoPX, rectoPY+rectoSY/2-20);

      if (update.mouseOver() && mousePressed && !onePress) {
        onePress = true;
        println("clicked");
      }
    } else {
      fill(0, 255, 255);
      textSize(15);
      textAlign(CENTER);
      text("OFFLINE MODE", posX+sizeX/2, posY+cellSize/2+5);
    }
  }
  void move(boolean dir) {
    if (dir) {
      if (posY > height-sizeY+cellSize) {
        posY-=20;
      }
    } else {
      if (posY < height-cellSize) {
        posY+=20;
      }
    }
  }
  boolean mouseOver() {
    return (mouseX > posX  &&
      mouseX < posX+sizeX &&
      mouseY > posY &&
      mouseY < posY+sizeY);
  }
}