class gameLayout_rocket{
  
  object_rocket rck;
  
  rocket_itemList rck_il;
  
  public gameLayout_rocket(){
    loadPieces();
    loadParts();
    loadRockets();
    rck = new object_rocket();
    rck_il = new rocket_itemList();
    
    
  }
  
  void display(PGraphics GM){
    GM.beginDraw();
      GM.background(0);
      rck.display(GM);
      rck_il.display(GM);
      objects_rockets.get(1).display(GM);
    GM.endDraw();
  }
  
  void display(){
  }
  
  ////
  
  ////
  
  ////
  
  void loadParts(){
    JSONObject json = load_JSON("./data/objects/rocket/parts.json");

    JSONArray jsona = json.getJSONArray("parts");
    
    for(int i =0; i < jsona.size(); i++){
      JSONObject jsono = jsona.getJSONObject(i);

      objects_parts.add(
        new rocket_part( 
          jsono.getString("name"), 
          jsono.getInt("id"),
          jsono.getInt("type"), 
          jsono.getInt("size")
        )
      );
    }
  }
  
  ////
  
  ////
  
  ////
  
  void loadPieces(){
    JSONObject json = load_JSON("./data/objects/rocket/pieces.json");

    JSONArray jsona = json.getJSONArray("pieces");
    
    for(int i =0; i < jsona.size(); i++){
      JSONObject jsono = jsona.getJSONObject(i);

      objects_pieces.add(
        new rocket_piece( 
          jsono.getString("name"), 
          jsono.getInt("id"),
          jsono.getInt("type"), 
          jsono.getInt("size")
        )
      );
    }
  }
  
  ////
  
  ////
  
  ////
  
  void loadRockets(){
    ArrayList<Integer> parts_id = new ArrayList<Integer>();
    
    JSONObject json = load_JSON("./data/objects/rocket/rockets.json");

    JSONArray jsona = json.getJSONArray("rockets");
    
    for(int i =0; i < jsona.size(); i++){
      
      JSONObject jsono = jsona.getJSONObject(i);
      
      int Rid = jsono.getInt("id");
      String Rname = jsono.getString("name");
      JSONArray jsonoa = jsono.getJSONArray("parts");
      
      for(int j=0; j <jsonoa.size(); j++){
        JSONObject jsonoo = jsonoa.getJSONObject(j);
        
        parts_id.add(jsonoo.getInt("id"));
        
      }
      println(Rname);
      
      objects_rockets.add(
        new object_rocket( 
          Rname,
          Rid,
          parts_id
        )
      );
      parts_id.clear();
    }
    println("rockets: "+objects_rockets);
  }
}