class rocket_part{
  int id;
  int type;
  int temperature = 0;
  
  int gridSizeX;
  int gridSizeY;
  
  int sizeX;
  int sizeY;
  
  int size;
  
  int positionX =width/2;
  int positionY = height/2;
  
  String name;
  
  boolean canShowPieces;
  
  PImage bodyWork;  
  
  ArrayList<rocket_piece> pieces = new ArrayList<rocket_piece>();
  
  public rocket_part(){
    
  }
  public rocket_part(String tname, int tid, int ttype, int tsize){
    id = tid;
    size = tsize;
    name = tname;
    type = ttype;
    bodyWork = parts.get(id);
  }
  
  public rocket_part(String tname, int tid, int ttype, int tsize, ArrayList p){
    id = tid;
    size = tsize;
    name = tname;
    type = ttype;
    bodyWork = parts.get(id);
    
    setPieces(p);
  }
  
  void display(PGraphics GM){
    
    
    GM.tint(255-temperature);
    GM.image(bodyWork,positionX, positionY);
    
    if(canShowPieces){
      for(rocket_piece rp : pieces){
        rp.display(GM);
      }
    }

  }
  void setPieces(ArrayList a){
    pieces = a;
  }
  void showPieces(boolean a){
    canShowPieces = a;   
  }
}