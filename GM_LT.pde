class gameLayout {

  String ACTUAL_name_homePlanet;
  String ACTUAL_name_planet = "UNKNOWN";
  String ACTUAL_name_world;
  String ACTUAL_name_galaxy;
  String ACTUAL_name_space;
  
  PGraphics GM;
  String gameLayout_state = "orbit control";

  gameLayout_rocket       rocketEditor;
  gameLayout_surface      surface;
  gameLayout_orbitControl orbitControl;

  public gameLayout() {
    GM = createGraphics(width, height, P3D);
    surface       = new gameLayout_surface();
    rocketEditor  = new gameLayout_rocket();
    orbitControl  = new gameLayout_orbitControl();
  }

  void display() {
    
    switch(gameLayout_state){
      case "planet surface":
        display_MAPVIEW();
        image(GM, 0, 0);
      break;
      
      case "rocket creator":
        display_ROCKETCREATOR();
        image(GM, 0, 0);
      break;
      
      case "orbit control":
        display_ORBITCONTROL();
      break;
    }
    
    
  }

  ///
  
  void display_MAPVIEW(){
    surface.display(GM);
  }
  
  ///
  
  void display_ROCKETCREATOR(){
    rocketEditor.display(GM);
  }
  
  ///
  
  void display_ORBITCONTROL(){
    orbitControl.display();
  }
  
  
  void setInformations(String[] a){
    ACTUAL_name_homePlanet = a[6];
    ACTUAL_name_planet = a[6];
    ACTUAL_name_world = "b";
    ACTUAL_name_galaxy = a[7];
    ACTUAL_name_space = a[8];
  
  }
  
  ////////////////////////////////////////////////////////
  
  boolean playerCanGo(int a) {
    return surface.playerCanGo(a);
  }
  
  int getWidth() { 
    return GM.width;
  }
  int getHeight() { 
    return GM.height;
  }

  int getMapWidth() {
    return surface.getMapWidth();
  }
  int getMapHeight() {
    return surface.getMapWidth();
  }

  void move(int dir) {
    surface.move(dir);
  }
  void isBarrier() {
    surface.isBarrier();
  }
  void setMap(String act){
    surface.setMap(act);
  }
  
  void createMap(String name){
    surface.createMap(name);
  }
}