class statistics_view{
  int positionX;
  int positionY;
  
  void display(){
    stroke(255,255,255,0);
    fill(0,255,255,10);
    rect(positionX*cellSize, positionY*cellSize,20*cellSize,11*cellSize);
  }
  
  
  void setPosition(int x, int y){
    positionX = x;
    positionY = y;;
  }
}