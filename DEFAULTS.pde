

/* ------------------------------------------------------------ *\
 TRY GET DEFAULTS
 \* ----------------------------------------------------------- */


void tryDefaults() {
  try {
    DEF_informations = load_JSON(   sketchPath()+"/data/defaults/informations.json");
    DEF_settings     = load_JSON(   sketchPath()+"/data/defaults/settings.json");

    DEF_developer    = DEF_settings.getBoolean("Developer");
    DEF_autoupdate   = DEF_settings.getBoolean("AutoUpdate");
    DEF_fullScreen   = DEF_settings.getBoolean("FullScreen");

    DEF_fps          = DEF_settings.getInt("FPS"); 
    DEF_Width        = DEF_settings.getInt("Width");
    DEF_Height       = DEF_settings.getInt("Height");
  }
  catch(NullPointerException NPE) {
    DEF_InError = true;
    DEF_error   = "Settings couldn't be loaded";
  }
}

/* ----------------------------------------------------------- *\
 TRY DOWNLOAD FROM SERVER
 \* ----------------------------------------------------------- */

void tryDownload() {
  try {
    DEF_conectivity = true;
    load_JSON("http://spacer.vilimek.co/update/update.json");
    JSONObject a = load_JSON("http://spacer.vilimek.co/update/update.json");

    println("Successfuly connected to the servers");

    UPDATE = !a.getString("NewestVersion").equals(version);
  }
  catch(NullPointerException NPE) {
    DEF_conectivity = false;
    println("Can not connect to the servers");
  }
}

/* ----------------------------------------------------------- *\
 TRY LOAD TEXTURES/IMAGES
 \* ----------------------------------------------------------- */

void tryLoadImages() {
  try {
    DEF_icon            = loadImage("./data/imgs/icon.png"             );
    DEF_TileSet_walls   = loadImage("./data/textures/tiles/tiles.png"  );
    DEF_TileSet_skins   = loadImage("./data/textures/skins/skins.png"  );
    DEF_TileSet_parts   = loadImage("./data/textures/parts/parts.png"  );

    planTexture  = requestImage( "./data/imgs/earth-map.jpg"     );
    planGround   = requestImage( "./data/imgs/ground.jpg"        );
    planClouds   = requestImage( "./data/imgs/cloudimage_2.png"  );
    st_field     = requestImage( "./data/imgs/starfield.jpg"     );
    planHEX      = requestImage( "./data/imgs/hex.png"           );
    spacer_logo  = requestImage( "./data/imgs/spacer.png"        );

    miner        = loadImage("./data/textures/objects/miner.png");

    surface.setIcon(DEF_icon);
  }
  catch(NullPointerException NPE) {
    //NPE.printStackTrace();
  }
}
/* ----------------------------------------------------------- *\
 OBJECTS CREATOR
 \* ----------------------------------------------------------- */

void createObjects() {
  
  cellSize = width/39;
  
  gL = new gameLayout();
  MS = new MainScreen();
  LDG = new Loading();
  SP = new SinglePlayer();

  lines.clear();

  for (int i = 0; i < width/cellSize+1; i++) {
    lines.add(new grid_line(i, cellSize*i, 0, cellSize*i, height));
    lines.add(new grid_line(i, 0, cellSize*i, width, cellSize*i));
  }
}


/* ----------------------------------------------------------- *\
 CHECKERS
 \* ----------------------------------------------------------- */

void checkDisplay() {
  if (DEF_fullScreen) {
    fullScreen(P3D);
  } else {
    size(DEF_Width, DEF_Height, P3D);
  }
}

void checkError() {
  if (DEF_InError) {
    println(DEF_error);
  }
}


/* ----------------------------------------------------------- *\
 SETTERS
 \* ----------------------------------------------------------- */


void setIcon() {
  surface.setIcon(DEF_icon);
}

void exit() {
  closeApp();
}
void closeApp() {
  //settings.setInt("MinutesPlayed", settings.getInt("MinutesPlayed")+((millis()/1000)/60));

  // if(DEVELOPER){
  //   save_JSON(settings,sketchPath()+"/data/defaults/settings.json");
  //   appup.createUpdateFiles();
  // }
  super.exit();
  //System.exit(0);
}

void transitioningHide() {
  if (transTO == actualLayout) {
    if (transitioning && transL >= 255) {
      transitioning = false;
      transL = 0;
      transLO = 255;
    }
  }
}
void transNeedToHide() {
  if (transitioning && transL >= 255) {
    transitioning = false;
    transL = 0;
    transLO = 255;
  }
}

boolean wATrans_IfTrans(int urls, boolean loader) {

  if (transitioning) {
    transTO = urls;
    if (transL < 255) {
      transL  += 5;
      transLO -= 5;
      return true;
    } else {
      if (loader) {
        LDG.loadLayout(urls);
      } else {
        actualLayout = urls;
      }
      return false;
    }
  } else {
    return false;
  }
}