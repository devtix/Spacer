class planetViewer{
  int positionX;
  int positionY;
  
  switch_button sb1;
  switch_button sb2;
  switch_button sb3;
  
  boolean showPointer;
  boolean showClouds;
  boolean showGrids;
  
  PGraphics show;
  
  private int pointerPositionX;
  private int pointerPositionY;
  
  private int scaleX,scaleY, vyska;
  private String name, desc;
  
  PImage starfield;

  PShape planet;
  PImage plantex;
  
  PShape clouds;
  PImage cloutex;
  
  PShape HEX;
  PImage HEXtex;
  
  {
    scaleX = 200; scaleY = 200; vyska = 10000;
    name = "UNKNOWN"; desc = "PLANET VIEW";
  }
  
  public planetViewer(){
    show = createGraphics(14*cellSize,14*cellSize,P3D);
    
    starfield = st_field;
    plantex = planTexture; 
    cloutex = planClouds;
    HEXtex = planHEX;
    
    noStroke();
    fill(255);
    sphereDetail(20);
  
    planet = createShape(SPHERE,cellSize*4-(cellSize/2));
    planet.setTexture(plantex);
    
    clouds = createShape(SPHERE, (cellSize*4-(cellSize/2))+5);
    clouds.setTexture(cloutex);
    
    HEX = createShape(SPHERE, (cellSize*4));
    HEX.setTexture(HEXtex);
    
    sb1 = new switch_button("CLOUDS");
    sb2 = new switch_button("GRIDS");
    sb3 = new switch_button("POINTER");
    
    sb1.setActive(true);
    sb2.setActive(true);
    sb3.setActive(true);
  }
  
  public void setPosition(int x, int y){
    positionX = x;
    positionY = y;
    
  }
  public void display(){
    
    name = gL.ACTUAL_name_planet.toUpperCase();
    
    
    sb1.setPosition((positionX+9)*cellSize-21,(positionY+12)*cellSize);
    sb2.setPosition((positionX+11)*cellSize-11,(positionY+12)*cellSize);
    sb3.setPosition((positionX+13)*cellSize-1,(positionY+12)*cellSize);
    
    showPointer = sb3.active;
    showGrids = sb2.active;
    showClouds = sb1.active;
    
    create_Images();
    create_Border();
    create_Lines();
    create_Pointer();
    create_Texts();
  }
  
  private void create_Images(){
    
    /*starField.resize(14*cellSize,14*cellSize);
    if(showImages){
      image(starField,positionX*cellSize, positionY*cellSize);
      image(planet,(positionX+7)*cellSize-(planet.width/2), (positionY+7)*cellSize-(planet.height/2));
    }*/
  }

  
  
  private void create_Border(){
    show.beginDraw();
      show.background(0);
      
      /*
      show.beginCamera();
      show.camera();
      show.rotateX(-PI/6);
      show.endCamera();
      */

      show.hint(DISABLE_DEPTH_MASK);
      //show.image(starfield, 0, 0, show.width, show.height);
      show.hint(ENABLE_DEPTH_MASK);
      
      show.pushMatrix();
        show.translate(show.width/2, show.height/2, cellSize*2+(cellSize/2));  
        /*
        show.pushMatrix();
          show.rotateY(PI * frameCount / 5000);
          show.shape(planet);
        show.popMatrix();
        */
        show.pointLight(255,  255,  255,  0,  0,  show.width);  
        show.rotateY(PI * frameCount / 15000 );
        show.shape(planet,0,0);
        
        if(showClouds){
          show.rotateY(PI * frameCount / 8000 );
          show.shape(clouds,0,0);
        }
        
        if(showGrids){
          show.rotateY(PI * frameCount / 20000 );
          show.shape(HEX,0,0);
        }
      
      show.popMatrix();

    show.endDraw();
    
    image(show, positionX*cellSize, positionY*cellSize);
    
    stroke(255,255,255,0);
    fill(0,255,255,10);
    /*rect(  positionX*cellSize       , positionY       *cellSize   ,  14*cellSize  ,    cellSize);
    rect(  positionX*cellSize       , (positionY+13)  *cellSize   ,  14*cellSize  ,    cellSize);
    
    rect(  positionX*cellSize       , (positionY+1)   *cellSize   ,  cellSize     ,  12*cellSize);
    rect(  (positionX+13)*cellSize  , (positionY+1)   *cellSize   ,  cellSize     ,  12*cellSize);
    */
    stroke(0,255,255,200);
    fill(255,255,255,0);
    
    line((positionX)*cellSize     , (positionY+3)    *cellSize   , (positionX+14)*cellSize   ,   (positionY+3)    *cellSize);
    line((positionX)*cellSize     , (positionY+11)   *cellSize   , (positionX+14)*cellSize   ,   (positionY+11)   *cellSize);
    
    line((positionX)*cellSize     , (positionY+3)    *cellSize   , (positionX)*cellSize      ,   (positionY+11)   *cellSize);
    line((positionX+14)*cellSize  , (positionY+3)    *cellSize   , (positionX+14)*cellSize   ,   (positionY+11)   *cellSize);
    
    //rect(  (positionX)*cellSize     , (positionY+3)   *cellSize   , 14*cellSize   ,   8*cellSize);
    
    stroke(255);
  }
  
  private void create_Lines(){
    
    stroke(0,255,255);
    strokeWeight(2);
    
    line(  (  positionX     )*cellSize  +cellSize/2  ,  (positionY  +4  )*cellSize  -cellSize/2       ,  (positionX  +1 )*cellSize               ,  (positionY  +4  )*cellSize  -cellSize/2       );
    line(  (  positionX +13 )*cellSize               ,  (positionY  +4  )*cellSize  -cellSize/2       ,  (positionX  +13)*cellSize  +cellSize/2  ,  (positionY  +4  )*cellSize  -cellSize/2       );
    
    line(  (  positionX     )*cellSize  +cellSize/2  ,  (positionY  +11 )*cellSize  -cellSize/2       ,  (positionX  +1 )*cellSize               ,  (positionY  +11 )*cellSize  -cellSize/2       );
    line(  (  positionX +13 )*cellSize               ,  (positionY  +11 )*cellSize  -cellSize/2       ,  (positionX  +13)*cellSize  +cellSize/2  ,  (positionY  +11 )*cellSize  -cellSize/2       );
    
    line(  (  positionX     )*cellSize  +cellSize/2  ,  (positionY  +7  )*cellSize                    ,  (positionX  +1 )*cellSize               ,  (positionY  +7  )*cellSize                    );
    line(  (  positionX +13 )*cellSize               ,  (positionY  +7  )*cellSize                    ,  (positionX  +13)*cellSize  +cellSize/2  ,  (positionY  +7  )*cellSize                    );
    
    strokeWeight(1);
    
    for( int i = 0; 
         i < dist((positionX)*cellSize  +cellSize/2  ,  (positionY  +4 )*cellSize   -cellSize/2       ,  (positionX     )*cellSize  +cellSize/2  ,  (positionY  +11 )*cellSize  -cellSize/2)/3     ; 
         i++
    ){
      line(  (positionX     )*cellSize  +cellSize/2  ,  (positionY  +4 )*cellSize   -cellSize/2+(i*3) ,  (positionX  +1 )*cellSize  -cellSize/4  ,  (positionY  +4  )*cellSize  -cellSize/2+(i*3) );
      line(  (positionX+13  )*cellSize  +cellSize/2  ,  (positionY  +4 )*cellSize   -cellSize/2+(i*3) ,  (positionX  +13)*cellSize  +cellSize/4  ,  (positionY  +4  )*cellSize  -cellSize/2+(i*3) );
      
    }
    
    
    stroke(255);
    

    
    
    sb1.display();
    sb2.display();
    sb3.display();
  }
  
  private void create_Pointer(){
    if (sqrt(sq((positionX+7)*cellSize-mouseX) + sq((positionY+7)*cellSize-mouseY)) < cellSize*5 && mouseY > (positionY+3)*cellSize && mouseY < (positionY+11)*cellSize) {
      pointerPositionX = mouseX;
      pointerPositionY = mouseY;
          
    }else{
      pointerPositionX = (positionX+6)*cellSize;
      pointerPositionY = (positionY+5)*cellSize;
    }
    if(showPointer){
      own_pointerSystem(pointerPositionX,pointerPositionY); 
    }
  }
  
  private void own_pointerSystem(int tpX, int tpY){
    stroke(0,255,255,150);
    line(positionX*cellSize,tpY,tpX,tpY);
    line((positionX+14)*cellSize,tpY,tpX,tpY);
      
    line(tpX,positionY*cellSize,tpX,tpY);
    line(tpX,(positionY+14)*cellSize,tpX,tpY);
    strokeWeight(7);
     
    fill(255,255,255,0);  
    stroke(0,255,255,100);
    ellipse(tpX,tpY,55,55);
    strokeWeight(1);
    pointer(tpX,tpY);
  }
  //-------------------------------------------------------------
  //-----------------------.. TEXTS -----------------------------
  //-------------------------------------------------------------
  
  private void create_Texts(){
    textSize(20);
  
    fill(255,170,0);
    
    textfield( "1"                             , ( positionX +13)*cellSize+cellSize/2, positionY       *cellSize  +12        );
    
    fill(150,255,255);
    textfield( "C"                             , ( positionX +13)*cellSize           , positionY       *cellSize  +12        );
    
    textSize(12);
    textfield( name                            , ( positionX  +2)*cellSize           , positionY       *cellSize             );
    
    textSize(10);
    
    textfield( "X: "+pointerPositionX+" - Y: "+pointerPositionY    , ( positionX    )*cellSize+5         , (positionY +13) *cellSize+cellSize/2-5 );
    
    textAlign(RIGHT);
    textfield(      vyska+"x"                  , ( positionX +13)*cellSize-cellSize/2, (positionY +13) *cellSize+cellSize/2-5   );
    
    fill(255,170,0);
    textfield( desc                            , ( positionX  +2)*cellSize           , positionY       *cellSize+15           );
    
    stroke(255,255,255,0);
  }
  
}