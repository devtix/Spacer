import processing.net.*;
import java.util.Date;

/* ----------------------------------------------------------- *\
 MAIN
 \* ----------------------------------------------------------- */

void settings() {

  ////////////////////

  tryDefaults();
  tryDownload();
  tryLoadImages();

  ////////////////////

  checkDisplay();
  checkError();

  /////////////////////
}


void setup() {
  ////////////////////
  createTextures();
  createObjects();

  ////////////////////

  frameRate             ( DEF_fps   );
  surface.setTitle      ( DEF_title );
  surface.setResizable  ( true      );


  ////////////////////

  println(DEF_conectivity);

  ////////////////////
};