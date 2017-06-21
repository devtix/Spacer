PImage miner;

ArrayList<PImage> parts = new ArrayList<PImage>();

/* ----------------------------------------------------------- *\
 TRIES & CATCHES
 \* ----------------------------------------------------------- */

PImage[] skin_guard      = new PImage[10];
PImage[] skin_doctor     = new PImage[10];
PImage[] skin_worker     = new PImage[10];
PImage[] skin_cooker     = new PImage[10];
PImage[] skin_sniper     = new PImage[10];
PImage[] skin_armored    = new PImage[10];
PImage[] skin_janitor    = new PImage[10];
PImage[] skin_gardener   = new PImage[10];
PImage[] skin_scientist  = new PImage[10];

/* ----------------------------------------------------------- *\
 TILES TEXTURES
 \* ----------------------------------------------------------- */


PImage[] dirt     = new PImage[10];
PImage[] wood     = new PImage[10];
PImage[] road     = new PImage[10];
PImage[] grass    = new PImage[10];
PImage[] stone    = new PImage[10];
PImage[] metal    = new PImage[10];
PImage[] gravel   = new PImage[10];
PImage[] mosaic   = new PImage[10];
PImage[] paving   = new PImage[10];
PImage[] wh_tile  = new PImage[10];
PImage[] cn_tile  = new PImage[10];
PImage[] ceramic  = new PImage[10];
PImage[] concrete = new PImage[10];


void createTextures() {
  createObjectsTextures();
  createGroundTextures();
  createSkinTextures();
  createPartTextures();
}

void createObjectsTextures() {
}

void createSkinTextures() {
  skin_armored   = getSkinTextures(0, 0);
  skin_guard     = getSkinTextures(4, 0);
  skin_janitor   = getSkinTextures(8, 0);
  skin_gardener  = getSkinTextures(12, 0);

  skin_sniper    = getSkinTextures(0, 4);
  skin_doctor    = getSkinTextures(4, 4);
  skin_cooker    = getSkinTextures(8, 4);
  skin_worker    = getSkinTextures(12, 4);
}

void createGroundTextures() {
  grass    = getGroundTextures(0, 4);
  dirt     = getGroundTextures(5, 4); 
  mosaic   = getGroundTextures(10, 4);
  paving   = getGroundTextures(15, 4);
  gravel   = getGroundTextures(20, 4);
  stone    = getGroundTextures(25, 4);

  wood     = getGroundTextures(0, 6);
  ceramic  = getGroundTextures(5, 6);
  cn_tile  = getGroundTextures(10, 6);
  road     = getGroundTextures(15, 6);
  concrete = getGroundTextures(20, 6);

  wh_tile  = getGroundTextures(22, 9);
}

void createPartTextures(){
  parts.add(getPartTexture(0,0));
  parts.add(getPartTexture(1,0));
  parts.add(getPartTexture(2,0));
  parts.add(getPartTexture(3,0));
  parts.add(getPartTexture(4,0));
}

PImage getPartTexture(int posX, int posY) {
  PImage[] images = new PImage[10]; 
  
  return  DEF_TileSet_parts.get(posX*64, posY*64, 64, 128);
}

PImage[] getSkinTextures(int posX, int posY) {
  PImage[] output = new PImage[1000];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      int ouc = (i*4)+j;
      output[ouc] = DEF_TileSet_skins.get((posX+j)*SCS, (posY+i)*SCS, SCS, SCS);
    }
  }
  return output;
}

PImage[] getGroundTextures(int posX, int posY) {
  PImage[] output = new PImage[10];
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 5; j++) {
      int ouc = (i*5)+j;
      output[ouc] = DEF_TileSet_walls.get((posX+j)*TCS, (posY+i)*TCS, TCS, TCS);
    }
  }
  return output;
}

PImage[] getSkinTextureById(int a) {
  PImage[] pm;

  switch(a) {
  case 0:
    pm = skin_armored;
    break;

  case 1:
    pm = skin_guard;
    break;

  case 2:
    pm = skin_janitor;
    break;

  case 3:
    pm = skin_gardener;
    break;

  case 4:
    pm = skin_sniper;
    break;

  case 5:
    pm = skin_doctor;
    break;

  default:
    pm = skin_worker;
    break;
  }

  return pm;
}

PImage getGroundTextureById(int a) {
  PImage[] pm;

  switch(a) {
  case 0:
    pm = grass;
    break;

  case 1:
    pm = dirt;
    break;

  case 2:
    pm = wood;
    break;

  case 3:
    pm = road;
    break;

  case 4:
    pm = gravel;
    break;

  case 5:
    pm = metal;
    break;

  case 6:
    pm = mosaic;
    break;

  case 7:
    pm = paving;
    break;

  case 8:
    pm = wh_tile;
    break;

  case 9:
    pm = cn_tile;
    break;

  case 10:
    pm = ceramic;
    break;

  case 11:
    pm = concrete;
    break;

  default:
    pm = grass;
    break;
  }

  return pm[0];
}