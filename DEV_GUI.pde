/*----------------------------------------------------------title
 ------                 Developer Console                  -------
 -----------------------------------------------------------------
 ------              Classes, Calcs, Setups                -------
 ---------------------------------------------------------------*/





/*----------------------------------------------------------class
 ------                 Developer Console                  -------
 ---------------------------------------------------------------*/
void set_devcon_visible() {
  /*if (key == 'f') {
    if (DEF_dev_gui) {
      DEF_dev_gui = false;
    } else {
      DEF_dev_gui = true;
    }
  }*/
  
}


// Function checking of button pressed "f"
void update_devcon() {
  // Is Alredy Showed
  set_devcon_visible();
  if (DEF_dev_gui) {
    /*---------- TEXT INFO ----------*/

    // Set text align to RIGHT, cause positions
    textAlign(RIGHT);
    textSize(12);
    fill(255);

    // Create text with: (name, version, framerate) 
    text("the SPACER v1.0.1 ( "+round(frameRate)+" FPS )", width-5, 20);

    // Create text with: (Current screen, current Layout of screen)
    text(" ("+DEF_actualLayout+" )", width-5, 40);

    // Create text with: (Current time [Hh,Mm,Ss])
    text(hour()+"h, "+minute()+"m, "+second()+"s", width-5, 60);

    // Create text with: Dimensions of actual Displayed Frame
    text((""+width+"x"+height), width-5, 80);

    // Create text with: Actual MousePoint position (X [Width],Y [Height])
    text(("X: "+mouseX+", Y: "+mouseY), width-5, 100);

    //if (currObject != null) { 
    //  text("Mouse is over: "+currObject+"", width-5, height-5);
    //}

    // Create text with: Actual number of second (Program running Seconds)
    text("started before: "+(millis()/1000)+"s", width-5, height-25);


    textAlign(LEFT);
    
    /*
    if (mousePressed) {
      if (firstpoint) {
        savePointX = mouseX; 
        savePointY = mouseY;
        tempObject = currObject;
        firstpoint = false;
      }
      if (savePointX != mouseX || savePointY != mouseY) {
        dragging = true;
        stroke(255, 165, 0);
        line(savePointX, savePointY, mouseX, mouseY);
        fill(255, 165, 0);
        if (tempObject != null) {
          text("Dragging ("+tempObject+") from [X: "+savePointX+", Y: "+savePointY+"] with distance ("+round(dist(mouseX, mouseY, savePointX, savePointY))+"px)", 5, height-5);
        } else {
          text("Dragging from [X: "+savePointX+", Y: "+savePointY+"] with distance ("+round(dist(mouseX, mouseY, savePointX, savePointY))+"px)", 5, height-5);
        }
      } else {
        fill(0, 255, 0);
        if (currObject != null) {
          text("Pressed ("+tempObject+") on [X: "+mouseX+", Y: "+mouseY+"] ", 5, height-5);
        } else {
          text("Pressed on [X: "+mouseX+", Y: "+mouseY+"]", 5, height-5);
        }
        dropped = false;
        dragging = false;
      }
    } else {
      if (dropped) {
        fill(255);
        if (tempObject == null) {
          text("Dropped to [X: "+dropX+", Y: "+dropY+"] from [X: "+savePointX+", Y: "+savePointY+"] with distance ("+round(dist(dropX, dropY, savePointX, savePointY))+"px)", 5, height-5);
        } else {
          if (tempObject == null) {
            text("Dropped to ("+tempObject+") to [X: "+dropX+", Y: "+dropY+"] from [X: "+savePointX+", Y: "+savePointY+"] with distance ("+round(dist(dropX, dropY, savePointX, savePointY))+"px)", 5, height-5);
          } else {
            text("Dropped ("+tempObject+") to [X: "+dropX+", Y: "+dropY+"] from [X: "+savePointX+", Y: "+savePointY+"] with distance ("+round(dist(dropX, dropY, savePointX, savePointY))+"px)", 5, height-5);
          }
        }
      }
    }
    */
    
    fill(255);

    /*---------- GRAPHIC INFO ----------*/

    // Set stroke color to RED (255,0,0)
    stroke(255, 0, 0, 50);
    // Create VERTICAL Line which is crossing the mouse positions 
    line(mouseX, height, mouseX, 0);

    // Set stroke color to BLUE (0,0,255)
    stroke(0, 0, 255, 50);
    // Create HORIZONTAL Line which is crossing the mouse positions 
    line(width, mouseY, 0, mouseY);

    // Set cursor type to CROSS, for better look
    cursor(CROSS);

    // Set stroke back cause other objects
    noStroke();
    // Set text align back to LEFT, case positions
    textAlign(LEFT);
   
  } else {
    // Set cursor type back to Default 
    cursor(ARROW);
  }
}