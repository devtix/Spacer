/* ----------------------------------------------------------- *\
 DRAW 
 \* ----------------------------------------------------------- */

void draw() {
  noStroke();
  background(black);
  
  routines();
  checkKeyboard();

  if (SVR_running) {
    text("Server running ("+svr.ip()+")", 10, 10);

    for (int i = 0; i < clients.size(); i++) {
      svr.write(i);
    }
  }

  if (CLN_running) {
    text("Client ("+CLN_id+") running ("+cln.ip()+")", 10, 10);
  }
  
  createLayout(actualLayout);


  if (st_w != width || st_h != height) {
    setup();
  }

  /*fill(255, 127, 0);
  textAlign(RIGHT);
  text("this is new version of app", width-10, 20);


  fill(0, 255, 255);
  textAlign(LEFT);
  text((millis()/1000)/60+" m : "+(millis()/1000)+" s", 10, 20);
  */
  
  
  
  if (transitioning) {
    fill(0, 0, 0, transL);
    stroke(0, 255, 255, 0);

    rectMode(CORNER);
    rect(0, 0, width, height);
  }
  
  /*
  fill(255);
  text(round(frameRate)+" FPS", 10, 15);
  */
  
  update_devcon();
  
  mouseWheelDirection = 0;
}

void rectangle(int x, int y, int sizeX, int sizeY){
  rect(x*cellSize, y*cellSize, sizeX*cellSize, sizeY*cellSize);
}

void textfield(String text, float x, float y){
  textAlign(LEFT);
  text(text,x+5, y+15);
}

void pointer(int x, int y){
   int diff = 10;
   fill(255,255,255,0);
   stroke(255);
   ellipse(x,y,30,30);
   line(x-diff,y-diff,x+diff,y+diff);
   line(x-diff,y+diff,x+diff,y-diff);
   
   stroke(255,255,255,50);
   ellipse(x,y,20,20);
   
   line(x-diff,y,x+diff,y);
   line(x,y-diff,x,y+diff);

   fill(255);
   ellipse(x,y,5,5);
   
   stroke(255);
}

color getColor(String a){
  color returner = color(0,255,255,10);
  switch(a){
    case "orange":
      returner = color(255,170,0);
    break;
    
    case "blue":
      returner = color(0,255,255);
    break;
    
    case "red":
    break;
    
    case "origin":
    break;
    
    case "background":
    break;
    
    case "foreground":
    break;
    
    case "trans-blue":
      returner = color(0,255,255,100);
    break;
    
    case "trans-orange":
      returner = color(255,170,0,100);
    break;  
    
    default:
      returner = color(0,255,255,10);
    break;
  }
  return returner;
}