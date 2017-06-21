class groundCam{
  
  int positionX;
  int positionY;
  int id;
  
  PImage marsGround;
  PImage marsGroundSelection;
  
  private int scaleX,scaleY, vyska;
  private String name, desc;
  private int viewX, viewY,defaultZOOM;
  
  {
    scaleX = 200; scaleY = 200; vyska = 10000;
    name = "UNKNOWN"; desc = "GROUND CAMERA";
  }
  
  PImage groundSurface;
  
  //------------------------------------------------------------------
  //----------------------- CONSTRUCTOR ------------------------------
  //------------------------------------------------------------------
  
  public groundCam(int tempID){
    id = tempID;
    marsGround = planGround;
    
    defaultZOOM = marsGround.width;
    //marsGround.resize(marsGround.width*2,marsGround.height*2);
    
    
  }
  
  public void setPosition(int x, int y){
    positionX = x;
    positionY = y;
    
  }
  public void changeViewPositions(){
    vyska = marsGround.width/defaultZOOM;
    viewX *= vyska;viewY *= vyska;  ;
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
  
  void move_UP()    {  if(  viewY  > 0                                        )   {  viewY -=vyska;  }  }
  void move_DOWN()  {  if(  viewY  < marsGround.height  -  ((  7*cellSize  )) )   {  viewY +=vyska;  }  }
  void move_LEFT()  {  if(  viewX  > 0                                        )   {  viewX -=vyska;  }  }
  void move_RIGHT() {  if(  viewX  < marsGround.width   -  ((  7*cellSize  )) )   {  viewX +=vyska;  }  }
  
  void zoom_IN()    {  marsGround.resize(marsGround.width*2 ,marsGround.height*2);changeViewPositions();}
  void zoom_OUT()   {  marsGround.resize(marsGround.width/2 ,marsGround.height/2);changeViewPositions();}
 
  
  private void create_BackImage(){
    vyska = marsGround.width/defaultZOOM;
    
    marsGroundSelection = marsGround.get(viewX,viewY,7*cellSize,7*cellSize);
    scaleX = viewX; scaleY = viewY;
    image(  marsGroundSelection,  positionX*cellSize,  positionY*cellSize);
  }
  
  private void create_keyChecker(){
    if(keyPressed){
      if(keyCode == LEFT ){
        move_LEFT();
      }
      if(keyCode == RIGHT){
        move_RIGHT();
      }
      if(keyCode == UP){ 
        move_UP();
      }
      if(keyCode == DOWN){
        move_DOWN();
      }
      
      if(key == 'p'&& !doOne){
        doOne = true;
        zoom_OUT();
      }
      
      if(key == 'o'&& !doOne){
        doOne = true;
        zoom_IN();
      }
    }
  }
  
  //-------------------------------------------------------------
  //-----------------------. BORDERS ----------------------------
  //-------------------------------------------------------------
  
  private void create_Borders(){
    fill(0,55,55,150);
    
    rectangle(  positionX   ,    positionY  ,    1,  7);
    rectangle(  positionX+6 ,    positionY  ,    1,  7);
    rectangle(  positionX+1 ,    positionY  ,    5,  1);
    rectangle(  positionX+1 ,    positionY+6,    5,  1);
  }
  
  //-------------------------------------------------------------
  //------------------------ POINTS -----------------------------
  //-------------------------------------------------------------
  
  private void create_Points(){
    stroke(255);  
    strokeWeight(5);
    point(  (  positionX+2)*cellSize  , (positionY+2)*cellSize);
    point(  (  positionX+5)*cellSize  , (positionY+5)*cellSize);
    point(  (  positionX+2)*cellSize  , (positionY+5)*cellSize);
    point(  (  positionX+5)*cellSize  , (positionY+2)*cellSize);
    
    strokeWeight(3);
    
    point(  (  positionX+2)*cellSize  +20  ,  (positionY+2)*cellSize  +20);
    point(  (  positionX+5)*cellSize  -20  ,  (positionY+5)*cellSize  -20);
    point(  (  positionX+2)*cellSize  +20  ,  (positionY+5)*cellSize  -20);
    point(  (  positionX+5)*cellSize  -20  ,  (positionY+2)*cellSize  +20);
    
    strokeWeight(2);
    
    point(  (  positionX+2)*cellSize  +40  ,  (positionY+2)*cellSize  +40);
    point(  (  positionX+5)*cellSize  -40  ,  (positionY+5)*cellSize  -40);
    point(  (  positionX+2)*cellSize  +40  ,  (positionY+5)*cellSize  -40);
    point(  (  positionX+5)*cellSize  -40  ,  (positionY+2)*cellSize  +40);
    
    
    strokeWeight(1);
  }
  
  //-------------------------------------------------------------
  //------------------------ LINES ------------------------------
  //-------------------------------------------------------------
  
  private void create_Lines(){
    stroke(255,255,255,125);
    
    line(  (positionX  +4 )*cellSize  -cellSize/2  ,  (positionY     )*cellSize  +cellSize/2,  (positionX  +4 )*cellSize  -cellSize/2  ,  (positionY  +2  )*cellSize     );
    line(  (positionX  +4 )*cellSize  -cellSize/2  ,  (positionY  +7 )*cellSize  -cellSize/2,  (positionX  +4 )*cellSize  -cellSize/2  ,  (positionY  +5  )*cellSize     );
    line(  (positionX     )*cellSize  +cellSize/2  ,  (positionY  +4 )*cellSize  -cellSize/2,  (positionX  +7 )*cellSize  -cellSize/2  ,  (positionY  +4  )*cellSize  -cellSize/2);
    
    stroke(255);
  }
  
  //-------------------------------------------------------------
  //------------------------- POINT -----------------------------
  //-------------------------------------------------------------
  
  private void create_Pointer(){
    if(mouseX >= (positionX+1)*cellSize &&
       mouseX <= (positionX+6)*cellSize &&
       mouseY >= (positionY+1)*cellSize &&
       mouseY <= (positionY+6)*cellSize
    ){
       pointer(mouseX,mouseY);
       create_keyChecker();
    }else{
      pointer((positionX+5)*cellSize-cellSize/4, (positionY+4)*cellSize+cellSize/4);
    }
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
    
    textAlign(RIGHT);
    textfield(vyska+"x", (positionX+7)*cellSize-cellSize/2-5, (positionY+7)*cellSize-cellSize/2-5);
    
    
    fill(255,170,0);
    textfield(desc,positionX*cellSize,positionY*cellSize+15);
    
  stroke(255,255,255,0);
  }
}