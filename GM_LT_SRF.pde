class gameLayout_surface{
  gameLayout_MAP     map;
  gameLayout_GUI     gui;
  gameLayout_PLAYER  pl;
  
  public gameLayout_surface(){
    //map = new MAP("Nový Svět");
    gui  = new gameLayout_GUI();
    map  = new gameLayout_MAP("My World");
    pl   = new gameLayout_PLAYER(7);
    pl.setPositions(width/2, height/2);
  }
  
  void display(PGraphics GM){
    GM.beginDraw();
    GM.noStroke();
    GM.background(0);
    map.display(GM);
    pl.display(GM);
    GM.endDraw();
  }
  
  void display(){
   
  }
 
  boolean playerCanGo(int a) {
    return pl.canGo(a);
  }
  
  

  int getMapWidth() {
    return map.getWidth();
  }
  int getMapHeight() {
    return map.getHeight();
  }

  void move(int dir) {
    pl.move(dir);
  }
  void isBarrier() {
    map.isBarrier();
  }
  void setMap(String act){
    map.loadMAP(act);
  }
  
  void createMap(String name){
    map.createMAP(name);
  }
 
 
}