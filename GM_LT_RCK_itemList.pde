class rocket_itemList {
  int positionX;
  int positionY;

  int sizeX;
  int sizeY;

  int actualView;
  
  boolean someActive;

  ArrayList<rocket_itemButton> itemButtons_rockets = new ArrayList<rocket_itemButton>();
  ArrayList<rocket_itemButton> itemButtons_pieces = new ArrayList<rocket_itemButton>();
  ArrayList<rocket_itemButton> itemButtons_parts = new ArrayList<rocket_itemButton>();

  rocket_filterButton rck_fb1;
  rocket_filterButton rck_fb2;
  rocket_filterButton rck_fb3;

  public rocket_itemList() {
    rck_fb1 = new rocket_filterButton("Pc");
    rck_fb2 = new rocket_filterButton("Pa");
    rck_fb3 = new rocket_filterButton("Ro");
    
    rck_fb1.setPositions(0,cellSize*1);
    rck_fb2.setPositions(0,cellSize*2);
    rck_fb3.setPositions(0,cellSize*3);
    
    for (int i = 0; i < objects_parts.size(); i++) {
      itemButtons_parts.add(new rocket_itemButton(i, 0));
      itemButtons_parts.get(i).setPosition(1, 1+i*2);
    }

    for (int i = 0; i < objects_pieces.size(); i++) {
      itemButtons_pieces.add(new rocket_itemButton(i, 0));
      itemButtons_pieces.get(i).setPosition(1, 1+i*2);
    }

    for (int i = 0; i < objects_rockets.size(); i++) {
      itemButtons_rockets.add(new rocket_itemButton(i, 0));
      itemButtons_rockets.get(i).setPosition(1, 1+i*2);
    }
  }

  void display(PGraphics GM) {
    
    
    switch(actualView) {
      case 0:
        displayPieces(GM);
        break;
  
      case 1:
        displayParts(GM);
        break;
  
      case 2:
        displayRockets(GM);
        break;
    }

    GM.stroke(0, 255, 255, 0);
    
    GM.fill(0, 255, 255,35);
    GM.rect(0, cellSize, cellSize, cellSize*39);
    
    rck_fb1.display(GM,someActive);
    rck_fb2.display(GM,someActive);
    rck_fb3.display(GM,someActive);
    
    if(rck_fb1.active){
      someActive = true;
      actualView = 0;
    }else
    if(rck_fb2.active){
      actualView = 1;
    }else
    if(rck_fb3.active){
      actualView = 2;
    }else{
      actualView = -1;
      someActive = false;
    }
    
    GM.fill(black);
    GM.rect(cellSize, 0, cellSize*2, cellSize);
  }

  void displayParts(PGraphics GM) {
    for (rocket_itemButton b : itemButtons_parts) {
      b.display(GM);
    }
  }

  void displayPieces(PGraphics GM) {
    for (rocket_itemButton b : itemButtons_pieces) {
      b.display(GM);
    }
  }

  void displayRockets(PGraphics GM) {
    for (rocket_itemButton b : itemButtons_rockets) {
      b.display(GM);
    }
  }
}