class orbitalsView{
  
  int positionX;
  int positionY;
  int id;
  
  private String name, desc;
  private int scaleX, scaleY;

  
  {
    name = "UNKNOWN"; desc = "ORBITALS";
  }

  
  //------------------------------------------------------------------
  //----------------------- CONSTRUCTOR ------------------------------
  //------------------------------------------------------------------
  
  public orbitalsView(int tempID){
    id = tempID;
    
  }
  
  public void setPosition(int x, int y){
    positionX = x;
    positionY = y;
    
  }

  void display(){
   
      name = gL.ACTUAL_name_planet.toUpperCase();
   
    
    
    create_BackImage();
    create_Borders();
    create_Points();
    create_Lines();
    create_Pointer();
    create_Texts();
  }
  
  //-------------------------------------------------------------
  //----------------------- BACKIMAGE ---------------------------
  //-------------------------------------------------------------
  
 
  
  private void create_BackImage(){
  }
  
  private void create_keyChecker(){

  }
  
  //-------------------------------------------------------------
  //-----------------------. BORDERS ----------------------------
  //-------------------------------------------------------------
  
  private void create_Borders(){
    fill(0,255,255,100);
    rect(positionX*cellSize, positionY*cellSize,7*cellSize,7*cellSize);
  }
  
  //-------------------------------------------------------------
  //------------------------ POINTS -----------------------------
  //-------------------------------------------------------------
  
  private void create_Points(){
     stroke(getColor("orange"));
     strokeWeight(8);
     point((positionX+7)*cellSize-cellSize/2,(positionY+7)*cellSize-cellSize/2);
     strokeWeight(1);
     
     stroke(255,255,255,0);
  }
  
  //-------------------------------------------------------------
  //------------------------ LINES ------------------------------
  //-------------------------------------------------------------
  
  private void create_Lines(){

  }
  
  //-------------------------------------------------------------
  //------------------------- POINT -----------------------------
  //-------------------------------------------------------------
  
  private void create_Pointer(){
    
  }
  
  //-------------------------------------------------------------
  //-----------------------.. TEXTS -----------------------------
  //-------------------------------------------------------------
  
  private void create_Texts(){
    textSize(20);
  
    fill(255,170,0);
    
    
    textfield("1",(positionX+6)*cellSize+20, positionY*cellSize+12);
    
    fill(150,255,255);
    textfield("C",(positionX+6)*cellSize, positionY*cellSize+12);
    
    textSize(12);
    textfield(name,positionX*cellSize,positionY*cellSize);
    
    textSize(10);
    
    textfield("X: "+scaleX+" - Y: "+scaleY, (positionX)*cellSize+5, (positionY+6)*cellSize+cellSize/2-5);
    
    
    fill(255,170,0);
    textfield(desc,positionX*cellSize,positionY*cellSize+15);
    
  stroke(255,255,255,0);
  }
}