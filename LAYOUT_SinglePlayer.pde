class SinglePlayer {

  ArrayList<listItem> items = new ArrayList<listItem>();

  int activeButton = -1;
  boolean noWorlds;
  
  String actualSelectedWorld;
  String[] info;
  
  background_view bw;

  button start;
  button edit;
  button delete;
  button copy;
  button create;

  button back;

  int scroolPos= 0;

  File[] files;

  PGraphics WL;

  public SinglePlayer() {
    WL = createGraphics(((width/4)/cellSize)*cellSize, 16*cellSize, P3D);
    bw = new background_view();



    back = new button("return", int(cellSize*3), int(cellSize*20.5), cellSize*4, cellSize);
    back.setURL(0);

    create = new button("new world", int(cellSize*8), int(cellSize*20.5), cellSize*4, cellSize);
    create.setTransitionNeedeability(false);
    create.setURL(1);

    start  = new button("play", int(cellSize*36), int(cellSize*20.5), cellSize*4, cellSize);
    start.setURL(2);
    start.setLoaderNeedeability(true);

    edit   = new button("edit", int(cellSize*30.5), int(cellSize*20.5), cellSize*3, cellSize);
    copy   = new button("copy", int(cellSize*26.5), int(cellSize*20.5), cellSize*3, cellSize);
    delete = new button("delete", int(cellSize*22.5), int(cellSize*20.5), cellSize*3, cellSize);
    delete.setTransitionNeedeability(false);
    delete.setURL(1);

    nactiSoubory();
  }
  void nactiSoubory() {
    items.clear();
    files = listFiles(sketchPath()+"/worlds");

    for (int i = 0; i < files.length; i++) {
      File f = files[i];
      items.add(new listItem(i, f.getName(), "0", new Date(f.lastModified())));
    }

    if (files.length < 1) {
      noWorlds = true;
    } else {
      noWorlds = false;
    }
  }

  void display() {

    transitioningHide();
    nactiSoubory();

    if (create.mouseOver() && mousePressed) {
      activeButton = -1;
    }

    if (keyPressed) {
      if (keyCode == UP) {
        scroolPos --;
      }
      if (keyCode == DOWN) {
        scroolPos++;
      }
    }



    background(0);

    WL.beginDraw();
    WL.background(0, 255, 255, 10);
    for (listItem li : items) {
      li.display(scroolPos, WL);
    }

    WL.endDraw();





    bw.display();
    bw.setMode(0);

    fill(255, 255, 255, 10);
    rectMode(CORNER);
    //rect(cellSize,cellSize,cellSize*10,((height/cellSize)-1)*cellSize);

    imageMode(CORNER);
    image(WL, cellSize, cellSize*3);
    imageMode(CORNER);

    fill(0, 255, 255, 5);

    int scroolSize;
    rect((((width/4)/cellSize)+1)*cellSize, 3*cellSize, cellSize/4, 16*cellSize);

    fill(0, 255, 255, 10);

    //if(mouseX > (((width/4)/cellSize)+1)*cellSize &&
    //   mouseX < (((width/4)/cellSize)+1)*cellSize+cellSize/4){}
    rect((((width/4)/cellSize)+1)*cellSize, 3*cellSize, cellSize/4, cellSize);


    if (activeButton >= 0) {

      File f = files[activeButton];
      JSONObject json =  load_JSON(f.getPath()+"\\informations.json");
      
      info = new String[9];
      
      info[0] = json.getInt("year")+"";
      info[1] = json.getInt("timePlayed")+"";

      //planets
      info[2] = json.getInt("ownedPlanets")+"";
      info[3] = json.getInt("discoveredPlanets")+"";
      info[4] = json.getInt("destroyedPlanets")+"";
      info[5] = json.getInt("createdPlanets")+"";

      //Name Infos

      info[6] = json.getString("nameOfMotherPlanet");
      info[7] = json.getString("nameOfGalaxy");
      info[8] = json.getString("nameOfUniverse");

      int rectaPosX =(((width/2)/cellSize)+2)*cellSize;
      int rectaSizeX =(((width/2)/cellSize)-2)*cellSize;

      rect(rectaPosX, cellSize*3, rectaSizeX, cellSize*5);
      rect(rectaPosX, cellSize*9, rectaSizeX, cellSize*10);

      textAlign(LEFT);
      fill(0, 255, 255);
      textSize(30);
      text(f.getName(), rectaPosX+10, cellSize*4-10);
      actualSelectedWorld = f.getName();
      textSize(20);

      textAlign(CENTER);
      text(info[6], rectaPosX+(rectaSizeX/6)*1, cellSize*10+cellSize/2-10);

      text(info[7], rectaPosX+(rectaSizeX/6)*3, cellSize*10+cellSize/2-10);

      text(info[8], rectaPosX+(rectaSizeX/6)*5, cellSize*10+cellSize/2-10);

      textSize(12);

      text("MOTHER PLANET", rectaPosX+(rectaSizeX/6)*1, cellSize*9+cellSize/2);


      text("GALAXY", rectaPosX+(rectaSizeX/6)*3, cellSize*9+cellSize/2);


      text("UNIVERSE", rectaPosX+(rectaSizeX/6)*5, cellSize*9+cellSize/2);
      textAlign(RIGHT);

       if(start.mouseOver() && mousePressed && !doOne){
        doOne = true;
        gL.setInformations(info);
      }

      start.display();
      edit.display();
      copy.display();
      delete.display();
      
     

      if (delete.mouseOver() && mousePressed && !doOne) {
        doOne = true;
        f.delete();
        nactiSoubory();
        activeButton -= 1;
      }
    }
    back.display();
    create.display();


    
    if (create.mouseOver() && mousePressed && !doOne) {
      doOne = true;
      nactiSoubory();
      String WoNa;
      if (items.size() < 1) {
        WoNa = "NEW_WORLD";
      } else {
        WoNa = "NEW_WORLD ("+items.size()+")";
        
      }
      saveJSONObject(DEF_informations, sketchPath()+"/worlds/"+WoNa+"/informations.json");
      create.setURL(2);
      createWorld(WoNa);
    }


    if (noWorlds) {
      fill(0, 255, 255, 127);
      textAlign(CENTER);
      textSize(20);
      text("THERE ARE NO WORLDS YET", (((width/4)/cellSize)*cellSize)/2+cellSize, cellSize*5);
      fill(0, 255, 255);
    }


    strokeWeight(1);
    for (grid_line o : lines) {
      o.display();
    }
    fill(0);
    textAlign(CENTER);
    textSize(10);
    text("SINGLEPLAYER", cellSize, cellSize);
  }
  
  void createWorld(String a){
    gL.createMap(a);
  }
}