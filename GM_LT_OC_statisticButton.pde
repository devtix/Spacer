class statistic_button{
  int positionX;
  int positionY;
  int id;
  
  PImage planet; 
  PImage starField;
  PImage starFieldSelection;
  
  private int type;
  private String name, desc;
  
  boolean activated = true;
  boolean systemStatus = true;
  
  
  public statistic_button(int temp_id, int temp_type){
    type = temp_type;
    id = temp_id;
  }
  
  void display(){
    stroke(255,255,255,0);
    
    int alpha;
    if(systemStatus){
      alpha = 25;
    }else{
      alpha = 10;
    }
    fill(0,255,255,alpha);
    rectangle(  positionX,          positionY, 5, 2);
    
    switch(type){
      case 1: type_first(); break;
      
      case 2: type_second(); break;
      
      case 3: type_third(); break;
      
      default:
      break;
    }
    textSize(13);
    fill(getColor("blue"));
    
    textfield(   "COMM - ", positionX*cellSize, positionY*cellSize);
    textfield(          "M", (positionX+5)*cellSize-cellSize, positionY*cellSize+cellSize/4);
    
    fill(getColor("orange"));
    
    textfield(       " "+id, (positionX+2)*cellSize-cellSize/2, positionY*cellSize);
    
    textAlign(LEFT);
    textfield(        ""+id, (positionX+5)*cellSize-cellSize/2-5, positionY*cellSize+cellSize/4);
    textAlign(RIGHT);
    
    stroke(255);
    strokeWeight(7);
    point((positionX+5)*cellSize-cellSize/2,(positionY+2)*cellSize-cellSize/2);
    
    strokeWeight(1);
    textSize(10);
    
  }
  
  private void type_first(){
    int alpha;
    if(activated){
      alpha = 75;
    }else{
      alpha = 0;
    }
    fill(0,255,255,alpha);
    rect((positionX+4)*cellSize,(positionY)*cellSize,cellSize,2*cellSize);
    
  }
  private void type_second(){}
  private void type_third(){}
  
  public void setPosition(int x, int y){
    positionX = x;
    positionY = y;
  }
  public void setStatus(boolean st){
    systemStatus = st;
  }
  public void setActivated(boolean ac){
    activated = ac;
  }
  
  
}