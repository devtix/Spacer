class rocket_piece{
  int id;
  String name;
  
  int type;
  int size;
  
  PImage bodykit;
  
  int positionX;
  int positionY;
  
  public rocket_piece(String tname){
    name = tname;
  }
  
  public rocket_piece(String tname, int tid, int ttype, int tsize){
    id = tid;
    size = tsize;
    name = tname;
    type = ttype;
    //bodyWork = TEX_parts.get(id);
  }
  
  void display(PGraphics GM){
    GM.image(bodykit, positionX, positionY);
  }
}