/* ----------------------------------------------------------- *\
 LISTS
 \* ----------------------------------------------------------- */

boolean[] keys = new boolean[4];
boolean[] dirs = new boolean[4];

/* ----------------------------------------------------------- *\
 LISTS
 \* ----------------------------------------------------------- */


ArrayList <Client>                clients = new ArrayList <Client>        ();
ArrayList <Character>          activeKeys = new ArrayList <Character>     ();

ArrayList <object_rocket> objects_rockets = new ArrayList <object_rocket> ();
ArrayList <rocket_part>   objects_parts   = new ArrayList <rocket_part>   ();
ArrayList <rocket_piece>  objects_pieces  = new ArrayList <rocket_piece>  ();


/* ----------------------------------------------------------- *\
 MULTIPLAYER THINGS
 \* ----------------------------------------------------------- */

Server svr;
Client cln;

/* ----------------------------------------------------------- *\
 GAME LAYOUT
 \* ----------------------------------------------------------- */

gameLayout gL;
MainScreen MS;
Loading LDG;
SinglePlayer SP;
//app_updater appup;

/* ----------------------------------------------------------- *\
 JSON OBJECTS
 \* ----------------------------------------------------------- */


JSONObject DEF_informations;
JSONObject DEF_settings;

/* ----------------------------------------------------------- *\
 STRINGS
 \* ----------------------------------------------------------- */


String DEF_error, 
  DEF_name    = "myApp", 
  DEF_stage   = "APLHA", 
  DEF_version = "v.0.0.0", 

  DEF_title = DEF_name    +" "
  +DEF_version +" "
  +DEF_stage, 

  DEF_actualLayout;


/* ----------------------------------------------------------- *\
 INTS   
 \* ----------------------------------------------------------- */


int DEF_fps, 
  DEF_Width, 
  DEF_Height, 

  cellSize = width/39, 
  indexZ, 
  
  TCS=32, 
  SCS=64,
  
  PCSX=64,
  PCSY=128,

  playerOverID, 

  SVR_id, 
  CLN_id, 

  saveTime = 0, 

  moveSpeed = 1,
  mouseWheelDirection, 

  gameLayoutPosX, 
  gameLayoutPosY;


/* ----------------------------------------------------------- *\
 BOOLEAN
 \* ----------------------------------------------------------- */


boolean DEF_autoupdate, 
  DEF_developer, 
  DEF_conectivity, 
  DEF_quality, 
  DEF_fullScreen, 
  DEF_InError, 
  DEF_texturepack, 
  DEF_dev_gui, 

  SVR_running, 
  SVR_InError, 

  CLN_running, 
  CLN_InError, 

  doOne;


/* ----------------------------------------------------------- *\
 IMAGES
 \* ----------------------------------------------------------- */


PImage DEF_icon, 
  DEF_logo, 

  DEF_TileSet_walls, 
  DEF_TileSet_objects, 
  DEF_TileSet_skins,
  DEF_TileSet_parts,
  DEF_TileSet_pieces;

/* ----------------------------------------------------------- *\
 TEXTURES
 \* ----------------------------------------------------------- */

ArrayList<PImage> TEX_walls     = new ArrayList<PImage>();
ArrayList<PImage> TEX_objects   = new ArrayList<PImage>();
ArrayList<PImage> TEX_parts     = new ArrayList<PImage>();



/* ----------------------------------------------------------- *\
 COLORS
 \* ----------------------------------------------------------- */

color white    = color(255, 255, 255), 
  black    = color(0, 0, 0), 

  red      = color(255, 0, 0), 
  green    = color(0, 255, 0), 
  blue     = color(0, 0, 255), 

  yellow   = color(255, 255, 0), 
  magenta  = color(255, 0, 255), 
  cyan     = color(0, 255, 255);

/* ----------------------------------------------------------- *\
 IMPORTED
 \* ----------------------------------------------------------- */

String version = "v.1.9.0 ALPHA";

ArrayList<grid_line> lines = new ArrayList<grid_line>();
JSONObject settings;
byte[] jar_copy;

int actualLayout = 0, 
  FPS, 
  st_w, 
  st_h, 
  timeDist, 
  transTO, 
  transL, 
  transLO = 255;

boolean   UPDATE, 
  CONECTIVITY, 
  DEVELOPER, 
  AUTOUPDATE, 
  QUALITY, 
  paused, 
  onePress, 
  oneKey, 
  transitioning;

PImage planTexture, planGround, planClouds, st_field, planHEX, spacer_logo;