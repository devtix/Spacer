class object_rocket{
  int id;
  String name = "none";
  
  int positionX = width/2;
  int positionY = height/2;
  
  int power;
  int capacity;
  int weight;
  
  int type;
  
  ArrayList<rocket_part> my_parts = new ArrayList<rocket_part>();
  
  public object_rocket(){
    
  }
  
  public object_rocket(String tname, int tid, ArrayList<Integer> al){
    id = tid;
    name = tname;
    loadRocketParts(al);
  }
  
  public object_rocket(int tid, String tname, int ttype){
    id = tid;
    name = tname;
    type = ttype;
  }
  
  
   void display(PGraphics GM){
    for(rocket_part rp : my_parts){
      rp.display(GM);
    }
    
    GM.stroke(255);
    GM.text(name, positionX, positionY);
  }
  
  void loadRocketParts(ArrayList<Integer> al){
    for(int i =0; i < al.size(); i++){
      for(int j =0; j < objects_parts.size();j++){
        if(al.get(i) == objects_parts.get(j).id){
          my_parts.add(
            new rocket_part(
              objects_parts.get(j).name,
              objects_parts.get(j).id,
              objects_parts.get(j).type,
              objects_parts.get(j).size
            )
          );
        }
      }
    }
    println("parts in rocket: "+my_parts);
  }
}