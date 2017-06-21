class Loading {
  int positionX;
  int positionY;

  int percentage;
  int ciel;

  int sizePerPercent;

  boolean easing;
  boolean loading;

  PGraphics show;

  PImage starfield;

  PShape planet;
  PImage plantex;

  public Loading() {
    show = createGraphics(width, height, P3D);
    positionX = width/2;
    positionY = height/2;

    starfield = st_field;
    plantex = planClouds;
    noStroke();
    fill(255);
    sphereDetail(40);

    planet = createShape(SPHERE, 100);
    planet.setTexture(plantex);
  }
  void display() {
    transNeedToHide();

    positionX = width/2;
    positionY = height/2;


    if (percentage < 100) {
      percentage++;
    } else {
      percentage = 0;
      actualLayout = ciel;
    }


    background(70);

    show.beginDraw();
    show.background(0);
    show.lights();      


    show.hint(DISABLE_DEPTH_MASK);
    //show.image(starfield, 0, 0, show.width, show.height);
    show.hint(ENABLE_DEPTH_MASK);

    show.pushMatrix();
    show.translate(show.width/2, show.height/2, 0);  
    /*
        show.pushMatrix();
     show.rotateY(PI * frameCount / 5000);
     show.shape(planet);
     show.popMatrix();
     */
    show.rotateY((PI * frameCount / 50 ));
    show.shape(planet, 0, 0);

    show.popMatrix();

    show.endDraw();

    image(show, 0, 0);

    stroke(0, 255, 255);
    fill(0, 0, 0, 50);
    rectMode(CENTER);
    int sizeOfBox = width-width/4;

    sizePerPercent = (sizeOfBox)/100;

    line(positionX-(sizeOfBox)/2, positionY-15, positionX+(sizeOfBox)/2, positionY-15);
    line(positionX-(sizeOfBox)/2, positionY+15, positionX+(sizeOfBox)/2, positionY+15);

    strokeWeight(5);
    //point((positionX-(sizeOfBox)/2+(sizePerPercent*(percentage+2)))+2,positionY-15);
    //point((positionX-(sizeOfBox)/2+(sizePerPercent*(percentage+2)))+2,positionY+15);

    //point(positionX-(sizeOfBox)/2,positionY-15);
    //point(positionX-(sizeOfBox)/2,positionY+15);

    point(positionX-sizePerPercent*((percentage/2)+1), positionY-15);
    point(positionX+sizePerPercent*((percentage/2)+1), positionY-15);

    point(positionX-sizePerPercent*((percentage/2)+1), positionY+15);
    point(positionX+sizePerPercent*((percentage/2)+1), positionY+15);

    strokeWeight(2);

    strokeWeight(1);

    rectMode(CENTER);

    fill(0, 255, 255, 25);
    rect(positionX, positionY, sizePerPercent*(percentage+2), 30);

    fill(0, 255, 255);
    textAlign(CENTER);
    textSize(20);
    text(percentage+" %", width/2, height/2+6);
    textSize(30);
    text("LOADING", width/2, height/6+6);
    textSize(10);
  }
  void loadLayout(int l) {
    actualLayout = -1;
    ciel = l;
  }
}