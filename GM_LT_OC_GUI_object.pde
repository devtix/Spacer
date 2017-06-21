class gui_object{
  private int ID;
  private int sizeX, sizeY;
  private int posX, posY;
  
  
  public gui_object(int id,int px, int py, int sx,int sy){
    ID = id;
    posX = px; 
    posY = py;
    
    sizeX = sx;
    sizeY = sy;
  }
  
  public void display(){
    stroke(255,255,255,5);
    line(posX,posY,sizeX,sizeY);
    
    fill(255);
    textAlign(CENTER);
    //text(ID,posX+20, posY+25);
  }
  
  public void set_positions(int px, int py){
    posX = px; 
    posY = py;
  }
}



int[] get_squareSizes(){
  int[] sizes = new int[10];
  
  // num of Cells on Width 
  sizes[0] = width/cellSize;
  
  // num of Cells on Width 
  sizes[1] = height/cellSize;
  
  // num of Cells on half of Width 
  sizes[2] = sizes[0]/2;
  
  // num of Cells on half of Height 
  sizes[3] = sizes[1]/2;
  
  return sizes;
} 