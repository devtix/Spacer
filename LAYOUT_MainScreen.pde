class MainScreen {
  ArrayList<button> bttn = new ArrayList<button>();

  background_view bw;
  logo lg;
  dataFeed df;

  int logoposX;
  int logoposY;


  public MainScreen() {

    st_w = width; 
    st_h = height;
    cellSize = width/39;
    bw = new background_view();
    lg = new logo();
    df = new dataFeed();
    if (CONECTIVITY) {
      df.loadDatas();
    }
    bw.setMode(-1);

    logoposX = lg.positionX;
    logoposY = lg.positionY;

    bttn.add(new button("singleplayer", width/2, height/2-70, 300, 30));
    bttn.add(new button("multiplayer", width/2, height/2, 300, 30));
    bttn.add(new button("options", width/2, height/2+70, 300, 30));
    bttn.add(new button("exit", width/2, height/2+140, 300, 30));

    bttn.get(0).setURL(1);
    bttn.get(1).setURL(2);
    bttn.get(2).setURL(3);

    bttn.get(3).setTransitionNeedeability(false);
  }

  void display() {
    transitioningHide();
    background(0);

    bw.display();



    /*if(appup.done){
     bttn.get(3).setPosition(width/2,height/2);
     bttn.get(3).setText("RESTART");
     
     fill(0,255,255);
     textAlign(CENTER);
     text("YOU NEED TO RUN THE GAME AGAIN", width/2,height/2-20);
     text("TO SEE STUFF FROM AN UPDATE", width/2,height/2+27);
     bttn.get(3).display();
     }else{*/
    for (button b : bttn) {
      b.display();
      /*  }
       }*/

      /*fill(255);
       textSize(10);
       textAlign(RIGHT);
       text("v. 1.0.0",width-10,height-10);
       text(WINDOWS+"", width-10, height-30);
       
       */

      lg.display();
      df.display();

      if (bttn.get(3).mouseOver() && mousePressed) {
        //closeApp();
        exit();
        //println("trying to close app");
      }
    }
  }
}