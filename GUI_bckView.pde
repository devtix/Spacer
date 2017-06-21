/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////                                           /////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

class background_view {
  int positionX, positionY;

  PGraphics show;

  PImage starfield;

  PShape planet;
  PImage plantex;

  PShape clouds;
  PImage cloutex;

  int li_posX;
  int li_posY;
  int li_posZ;

  int pl_posX;
  int pl_posY;
  int pl_posZ;

  int spd = 100;

  boolean movingpl;
  boolean moving;

  int showingMode;
  float showingAngle;

  public background_view() {
    show = createGraphics(width, height, P3D);
    starfield = st_field;
    plantex = planTexture; 
    cloutex = planClouds  ;
    noStroke();
    fill(255);
    sphereDetail(40);

    planet = createShape(SPHERE, height-height/12);
    planet.setTexture(plantex);

    clouds = createShape(SPHERE, (height-height/12)+5);
    clouds.setTexture(cloutex);
  }

  void setMode(int a) {
    showingMode = a;
  }

  void display() {
    if(moving){
       if (keyPressed) {
          switch(keyCode) {
          case UP:
            if (movingpl) {
              pl_posY-=spd;
            } else {
              li_posY-=spd;
            }
            break;
    
          case DOWN:
            if (movingpl) {
              pl_posY+=spd;
            } else {
              li_posY+=spd;
            }
            break;
    
          case LEFT:
            if (movingpl) {
              pl_posX-=spd;
            } else {
              li_posX-=spd;
            }
            break;
    
          case RIGHT:
            if (movingpl) {
              pl_posX+=spd;
            } else {
              li_posX+=spd;
            }
            break;
          }

          switch(key) {
          case 'p':
            li_posZ -= spd;
            break;
    
          case 'o':
            li_posZ += spd;
            break;
    
          case ' ':
            if (!movingpl) {
              movingpl = true;
            } else {
              movingpl = false;
            }
            break;
          }
      }
    }
   

    switch(showingMode) {
    case 0:
      pl_posX = -width/2;
      pl_posY = int(-height*0.6);

      li_posX = mover_TOWARDS(li_posX, width);
      li_posY = mover_TOWARDS(li_posY, width);
      showingAngle = TWO_PI;


      break;

    default:
      showingAngle = PI;
      break;
    }

    show.beginDraw();
    show.background(0);
    //show.lights();      
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
    show.translate(show.width/2+pl_posX, show.height*1.2+pl_posY, 0+pl_posZ);  

    /*
        show.pushMatrix();
     show.rotateY(PI * frameCount / 5000);
     show.shape(planet);
     show.popMatrix();
     */

    show.pointLight(255, 255, 255, 0+li_posX, -show.height*3.6+1050+li_posY, -show.height*2+650+li_posZ);  


    //show.rotateZ(showingAngle);

    if (showingAngle == PI) {

      show.rotateX(-(PI * frameCount / 15000 ));
      show.shape(planet, 0, 0);
      show.rotateX(-(PI * frameCount / 8000 ));
      show.shape(clouds, 0, 0);
    } else if (showingAngle == TWO_PI) {

      show.rotateY((PI * frameCount / 7500 ));
      show.shape(planet, 0, 0);
      show.rotateY((PI * frameCount / 4000 ));
      show.shape(clouds, 0, 0);
    }
    show.fill(255);
    //show.line(0,0,-show.height*2, -show.height/2);

    show.popMatrix();

    show.endDraw();

    image(show, 0, 0);



    /*
    fill(255);
    textAlign(LEFT);
    text(round(frameRate)+" FPS", 10, 10);
    text(movingpl+" moving the planet", 10, 30);
    textAlign(RIGHT);
    text("Planet x: "+pl_posX + ", y:" +pl_posY+", z:"+pl_posZ, width-10, 10);
    text("Light  x: "+li_posX + ", y:" +li_posY+", z:"+li_posZ, width-10, 30);
    */
  }

  int mover_TOWARDS(int initial, int finish) {
    if (initial < finish) {
      return initial + spd;
    } else {
      return finish;
    }
  }

  int mover_BACKWARDS(int initial, int finish) {
    if (initial > finish) {
      return initial - spd;
    } else {
      return finish;
    }
  }
}