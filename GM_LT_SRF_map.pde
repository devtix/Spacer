class gameLayout_MAP {
  //JSONObject MAP;
  String worldName;

  String name;
  String date;

  int mapSizeX;
  int mapSizeY;

  ArrayList<map_tile> MAP = new ArrayList<map_tile>();

  /* ----------------------------------------------------------- *\
   CONSTRUCTOR by world
   \* ----------------------------------------------------------- */

  public gameLayout_MAP(String world) {
    loadMAP(world);
    //checkBlock(55);
  }

  /* ----------------------------------------------------------- *\
   CONSTRUCTOR 
   \* ----------------------------------------------------------- */

  public gameLayout_MAP() {
    //loadMAP(world);
    //checkBlock(55);
  }

  /* ----------------------------------------------------------- *\
   DISPLAY MAP
   \* ----------------------------------------------------------- */

  void display() {
    fill(255);

    for (map_tile m : MAP) {
      m.display();
    }
  }

  /* ----------------------------------------------------------- *\
   DISPLAY MAP with PG
   \* ----------------------------------------------------------- */

  void display(PGraphics GM) {

    if (keyPressed) {
      if (key == ' ') {
        if (!doOne) {
          doOne = true;

          saveMap();
          println("map saved");
        }
      }
    }

    GM.fill(0);

    for (map_tile m : MAP) {
      m.display(GM);
    }
  }

  /* ----------------------------------------------------------- *\
   NEW MAP CREATOR
   \* ----------------------------------------------------------- */

  void createMAP(String worldNm) {
    int sizeX = 0, sizeY = 0;
    int idos = 0;

    worldName = worldNm;
    name = worldName;
    date = "today";


    for (int i = 0; i < 100; i++) {
      for (int j = 0; j <100; j++) {
        idos++;
        MAP.add(new map_tile(idos, 0, j, i));
      }
      sizeX++;
      sizeY++;
    }

    mapSizeX = sizeX*32;
    mapSizeY = sizeY*32;
    println(mapSizeX +" x "+mapSizeY);
  }

  /* ----------------------------------------------------------- *\
   LOAD MAP from file  
   \* ----------------------------------------------------------- */

  void loadMAP(String t_worldName) {
    int sizeX = 0, sizeY = 0;
    worldName = t_worldName;

    JSONObject json = load_JSON("./worlds/"+worldName+"/mapdata.json");

    name = json.getString("aName");
    date = json.getString("bDate");

    JSONArray jsona = json.getJSONArray("cdata");

    for (int a = 0; a < jsona.size(); a++) {
      JSONObject jsono = jsona.getJSONObject(a);
      sizeX++;
      sizeY++;

      MAP.add(
        new map_tile(
        jsono.getInt("id"), 
        jsono.getInt("block_id"), 
        jsono.getInt("positionX"), 
        jsono.getInt("positionY")
        )
        );
    }
    mapSizeX = int(sqrt(sizeX))*32;
    mapSizeY = int(sqrt(sizeY))*32;
  }

  /* ----------------------------------------------------------- *\
   SAVE map to file
   \* ----------------------------------------------------------- */

  void saveMap() {
    int numOfCycles = 0;
    JSONObject jsono = new JSONObject();
    JSONArray jsona  = new JSONArray();

    for (map_tile m : MAP) {

      JSONObject jsonos = new JSONObject();

      jsonos.setInt("id", m.id);
      jsonos.setInt("block_id", m.block_id);
      jsonos.setInt("positionX", (m.positionX/32));
      jsonos.setInt("positionY", (m.positionY/32));

      jsona.setJSONObject(numOfCycles, jsonos);

      numOfCycles++;
    }

    jsono.setString("aName", name+" newly saved");
    jsono.setString("bDate", date);
    jsono.setJSONArray("cdata", jsona);

    save_JSON(jsono, "./worlds/"+worldName+"/mapdata.json");
  }

  /* ----------------------------------------------------------- *\
   Print all infos about map
   \* ----------------------------------------------------------- */


  void printAllAboutMap() {
    String output;
    output = "\n---------------------------------------------- \n";
    output += name;
    output += "\n----------------------------------------------";

    for (int a = 0; a < MAP.size(); a++) {
      output += "\n( tile: "+MAP.get(a).id+", with: "+MAP.get(a).block_id+", positionX: "+MAP.get(a).positionX+", positionY: "+MAP.get(a).positionY+")";
    }

    output += "\n----------------------------------------------";
    println(output);
  }



  /* ----------------------------------------------------------- *\
   CHECK BLOCK
   \* ----------------------------------------------------------- */

  boolean checkBlock(int dir) {
    int pos = playerOverID;
    switch(dir) {
    case UP:
      return (pos > 99) ? MAP.get(pos-100).isSolid(): false;

    case DOWN:
      return (pos < getHeight()) ? MAP.get(pos+100).isSolid() : false;

    case LEFT:
      return (pos > 0)  ? MAP.get(pos-1).isSolid()   : false;

    case RIGHT:
      return (pos < getWidth()) ? MAP.get(pos+1).isSolid() : false;

    default:
      return MAP.get(pos).isSolid();
    }
  }

  /* ----------------------------------------------------------- *\
   isBarrier
   \* ----------------------------------------------------------- */

  void isBarrier() {
    dirs[0] = checkBlock(UP);
    dirs[1] = checkBlock(DOWN);
    dirs[2] = checkBlock(LEFT);
    dirs[3] = checkBlock(RIGHT);
  }

  /* ----------------------------------------------------------- *\
   GET WIDTH OF WHOLE MAP
   \* ----------------------------------------------------------- */

  int getWidth() {
    return mapSizeX;
  }

  /* ----------------------------------------------------------- *\
   GET HEIGHT OF WHOLE MAP
   \* ----------------------------------------------------------- */

  int getHeight() {
    return mapSizeY;
  }
}