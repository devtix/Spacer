class switch_button{
  String text;
  int positionX;
  int positionY;
  
  
  boolean active;
  
  public switch_button(){
  
  }
  
  public switch_button(String a){
    text = a;
  }
  
  void display(){
      fill(255,255,255,0);
      
      if(active){       
        stroke(0,255,255);
      }else{
        if(mouseOver()){
          stroke(0,255,255,50);
        }else{
          stroke(0,255,255,0);
        }
      }
      
      if(mouseOver() && mousePressed && !doOne){
        doOne = true;
        if(active){active = false;}else{active = true;}
      }
      line(positionX-50,positionY-(cellSize/2)-12,positionX+50,positionY-(cellSize/2)-12);
      line(positionX-50,positionY-(cellSize/2)+10,positionX+50,positionY-(cellSize/2)+10);
      
      line(positionX-50,positionY-(cellSize/2)-12,positionX-50,positionY-(cellSize/2)+10);
      line(positionX+50,positionY-(cellSize/2)-12,positionX+50,positionY-(cellSize/2)+10);
      
      stroke(255);
      rectMode(CORNER);
    
      textAlign(CENTER);
      fill(0,255,255);
      text(text,positionX, positionY-(cellSize/2)+3);
      textAlign(LEFT);
    
  }
  boolean mouseOver(){
    return mouseX >= positionX-50 &&
           mouseX <= positionX+50 &&
           mouseY >= positionY-(cellSize/2)-10 &&
           mouseY <= positionY-(cellSize/2)+10;
  }
  void setPosition(int x, int y){
    positionX = x;
    positionY = y;
  }
  
  void setActive(boolean ac){
    active = ac;
  }
}