class menu{
  int positionX;
  int positionY;
  int partOne = 14*cellSize; 
  int partTwo = 20*cellSize;
  
  ArrayList<menu_button> butt = new ArrayList<menu_button>();
  
  public menu(){
    butt.add(new menu_button("ACTIVITY"));
    butt.add(new menu_button("SENSORS"));
    butt.add(new menu_button("CONTROLS"));
    butt.add(new menu_button("TELEMETRY"));
    
    butt.get(3).setActive(true);
  }
  
  void display(){
    if(mouseOver_P1() && mousePressed){
      int sel =-1;
      for(int i=0;i<butt.size();i++){
        if(butt.get(i).mouseOver() && butt.get(i).active){
          sel = i;
        }
        if(i != sel){
          butt.get(i).active = false;
        }
      }
    }
    
    fill(0,255,255,10);
    rect((positionX)*cellSize,positionY*cellSize,((width/cellSize)-5)*cellSize,cellSize);
    
    fill(0,255,255);
    for(menu_button mebu : butt){
      if(mebu.active){}
      mebu.display();
    }
  }
  boolean mouseOver_P1(){
    return mouseX >= positionX*cellSize &&
           mouseX <= (positionX+14)*cellSize&&
           mouseY >= positionY*cellSize&&
           mouseY <= (positionY+1)*cellSize;
  }
  void setPosition(int x, int y){
    positionX = x;
    positionY = y;
    setButtonsPosition();
  }
  void setButtonsPosition(){
    int menu_space = partOne / butt.size();
    for(int i = 0; i < butt.size(); i++){
      butt.get(i).setPosition(((positionX+1)*cellSize)+i*menu_space+(cellSize/2)+10,(positionY+1)*cellSize);
    }
    
  }
}