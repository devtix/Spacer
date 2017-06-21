class rocket_itemButton{
  int positionX;
  int positionY;
  
  int scroolY;
  int id;
  
  
  private int type;
  private String name, desc;
  
  boolean activated = true;
  boolean systemStatus = true;
  
  PImage icono;
  
  public rocket_itemButton(int temp_id, int temp_type){
    type = temp_type;
    id = temp_id;
    
    switch(type){
      case 0:
        icono = parts.get(id);
      break;
      
      case 1:
        //icono = pieces.get(id);
      break;
      
      case 2:
        //icono = parts.get(id);
      break;
    }
    
    icono.resize(32,64);
  }

  void display(PGraphics GM){
    
    if(mouseWheelDirection !=0){
      if(mouseWheelDirection == -1 && scroolY == 0){
        
      }else{
        scroolY += mouseWheelDirection*cellSize/2;
      }
    }
    
    GM.stroke(0,255,255,0);
    
    GM.fill(0,255,255,25);
    
    
   
    
    GM.rect(positionX*cellSize, positionY*cellSize+scroolY, 2*cellSize, 2*cellSize);
    
    GM.imageMode(CENTER);
    GM.image(icono, positionX*cellSize+cellSize,positionY*cellSize+cellSize+scroolY);
    
    GM.fill(white);
    GM.textSize(12);
    GM.text(id, positionX*cellSize+cellSize, positionY*cellSize+cellSize+scroolY);
    
    GM.textSize(10);
    
  }
 public void setPosition(int x, int y){
    positionX = x;
    positionY = y;
  }
  
  
}