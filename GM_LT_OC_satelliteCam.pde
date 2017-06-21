class satellite_cam{
  int positionX,positionY;

  
  PImage fullCamView;
  PImage camView;
  
  PGraphics show;
  
  PImage starfield;

  PShape planet;
  PImage plantex;
  
  PShape clouds;
  PImage cloutex;
 
  public satellite_cam(){
    show = createGraphics(20*cellSize,10*cellSize,P3D);
    starfield = st_field;
    plantex = planTexture; 
    cloutex = planClouds  ;
    noStroke();
    fill(255);
    sphereDetail(40);
  
    planet = createShape(SPHERE,cellSize*8);
    planet.setTexture(plantex);
    
    clouds = createShape(SPHERE, (cellSize*8)+5);
    clouds.setTexture(cloutex);
  }
  
  void display(){

    
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
        show.translate(show.width-160, show.height+15, cellSize*2+(cellSize/2));  
        /*
        show.pushMatrix();
          show.rotateY(PI * frameCount / 5000);
          show.shape(planet);
        show.popMatrix();
        */
        show.pointLight(255,  255,  255,  -show.height,  -show.height/2,  -show.height/4);  
        show.rotateY(PI * frameCount / 15000 );
        show.shape(planet,0,0);
        
        show.rotateY(PI * frameCount / 8000 );
        show.shape(clouds,0,0);
      
      show.popMatrix();

    show.endDraw();
    
    image(show, positionX*cellSize, positionY*cellSize);
    
    
      //image(camView, positionX*cellSize,positionY*cellSize);
    
    create_Lines();
    
    stroke(255,255,255,60);
    fill(255,255,255,0);
    ellipse((positionX+10)*cellSize, (positionY+5)*cellSize,cellSize*4,cellSize*4);
    ellipse((positionX+10)*cellSize, (positionY+5)*cellSize,cellSize*4-30,cellSize*4-30);
    
    stroke(0,255,255);
    strokeWeight(3);
    point((positionX+10)*cellSize, (positionY+3)*cellSize);
    point((positionX+8)*cellSize+cellSize/2+3, (positionY+7)*cellSize-cellSize/2-3);
    point((positionX+11)*cellSize+cellSize/2-3, (positionY+7)*cellSize-cellSize/2-3);
    strokeWeight(1);
    
    fill(255);
    text(mouseX+"("+mouseX%cellSize+") - "+mouseY+"("+mouseY%cellSize+") - ( "+mouseX/cellSize+" - "+mouseY/cellSize+" )",positionX*cellSize,positionY*cellSize+20);
    text(((mouseX/cellSize)-positionX)+" - "+((mouseY/cellSize)-positionY),positionX*cellSize,positionY*cellSize+40);
    text(round(frameRate)+" fps",positionX*cellSize,positionY*cellSize+60);
    
    
  }
  private void create_Lines(){
    
    stroke(0,255,255);
    strokeWeight(2);
    
    //line(  (  positionX     )*cellSize  +cellSize/2  ,  (positionY  +4  )*cellSize  -cellSize/2       ,  (positionX  +1 )*cellSize               ,  (positionY  +4  )*cellSize  -cellSize/2       );
    line(  (  positionX +19 )*cellSize               ,  (positionY+1    )*cellSize  -cellSize/2       ,  (positionX  +19)*cellSize  +cellSize/2  ,  (positionY+1    )*cellSize  -cellSize/2       );
    
    //line(  (  positionX     )*cellSize  +cellSize/2  ,  (positionY  +11 )*cellSize  -cellSize/2       ,  (positionX  +1 )*cellSize               ,  (positionY  +11 )*cellSize  -cellSize/2       );
    line(  (  positionX +19 )*cellSize               ,  (positionY  +10 )*cellSize  -cellSize/2       ,  (positionX  +19)*cellSize  +cellSize/2  ,  (positionY  +10 )*cellSize  -cellSize/2       );
    
    //line(  (  positionX     )*cellSize  +cellSize/2  ,  (positionY  +7  )*cellSize                    ,  (positionX  +1 )*cellSize               ,  (positionY  +7  )*cellSize                    );
    line(  (  positionX +19 )*cellSize               ,  (positionY  +5  )*cellSize                    ,  (positionX  +19)*cellSize  +cellSize/2  ,  (positionY  +5  )*cellSize                    );
    
    strokeWeight(1);
    
    for( int i = 0; 
         i < dist((positionX)*cellSize  +cellSize/2  ,  (positionY   )*cellSize   -cellSize/2       ,  (positionX     )*cellSize  +cellSize/2  ,  (positionY  +9 )*cellSize  -cellSize/2)/3     ; 
         i++
    ){
      line(  (positionX+19  )*cellSize  +cellSize/2  ,  (positionY+1)*cellSize   -cellSize/2+(i*3) ,  (positionX  +19)*cellSize  +cellSize/4  ,  (positionY+1)*cellSize  -cellSize/2+(i*3) );
      
    }
    
    
    stroke(255);
  
  }
  void setPosition(int x, int y){
    positionX = x;
    positionY = y;
  }
  
  

}