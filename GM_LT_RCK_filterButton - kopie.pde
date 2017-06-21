class rocket_filterButton{
  int positionX;
  int positionY;
  
  int sizeX = cellSize;
  int sizeY = cellSize;
  
  boolean active;
  
  PImage icon;
  String name;
  
  public rocket_filterButton(String tname){
    name = tname;
  }
  
  void display(PGraphics GM, boolean sma){
    GM.stroke(0,255,255,0);
    
   
    
    if(active){
      GM.fill(0,255,255,50);
    }else{
      GM.fill(0,255,255,10);
    }
    
    if(mouseOver()){
      GM.fill(0,255,255,25);
    }
    
    if(mouseOver() && mousePressed && !doOne){
      doOne = true;
      if(active && sma){
        active = false;
      }else{
        active = true;
      }
    }
    
    GM.rect(positionX, positionY, sizeX,sizeY);
    
    GM.textAlign(CENTER);
    GM.textSize(12);
    GM.fill(255);
    GM.text(name,(positionX)+sizeX/2, (positionY)+sizeX*0.66);
    
    GM.textSize(10);
  }
  
  void setPositions(int x, int y){
    positionX = x;
    positionY = y;
  }
  
  boolean mouseOver(){
    return mouseX > positionX &&
           mouseX < positionX+sizeX &&
           
           mouseY > positionY&&
           mouseY < positionY+sizeY;
  }
}