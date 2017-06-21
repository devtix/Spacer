class gameLayout_orbitControl{
  ArrayList<gui_object> lines = new ArrayList<gui_object>();
  ArrayList<statistic_button> bttns = new ArrayList<statistic_button>();
  
  
  
  groundCam a;
  groundCam a1;
  planetViewer b;
  satellite_cam sc;
  statistics_view sv;
  orbitalsView ov;
  menu mn;
  
  public gameLayout_orbitControl(){
    lines.clear();
    
    for(int i = 0; i < width/cellSize+1 ; i++){
        lines.add(new gui_object(i,cellSize*i,0,cellSize*i,height));
        lines.add(new gui_object(i,0, cellSize*i,width,cellSize*i));
    }
    
    b = new planetViewer();
    a = new groundCam(1);
    sc = new satellite_cam();
    sv = new statistics_view();
    mn = new menu();
    ov= new orbitalsView(1);
    
    for(int i = 0; i < 9;i++){
      bttns.add(new statistic_button(i,1));
      bttns.get(i).setPosition(0,3+i*2);
      if(random(0,2) == 1){
        bttns.get(i).setActivated(true);
      }else{
        bttns.get(i).setActivated(false);
      }
      
      if(random(0,2) == 1){
        bttns.get(i).setStatus(true);
      }else{
        bttns.get(i).setStatus(false);
      }
      
    }
    
    
    ov.setPosition(5,1);
    a.setPosition(12,1);
    b.setPosition(5,8);
    sc.setPosition(19,1);
    mn.setPosition(5,0);
    sv.setPosition(19,11);
    
    println(height+"/"+cellSize+" = "+height/cellSize+" : "+((height/cellSize)-2)*cellSize);
    
  }
  
  void display(){
    
    if(mn.butt.get(0).active){
       displayActivity();
    }
    
    if(mn.butt.get(1).active){
      displaySensors();
    }
    
    if(mn.butt.get(2).active){
       displayControls();
    }
    
    if(mn.butt.get(3).active){
       displayTelemetry();
    }
        
    mn.display();
    sc.display();
    
    for(statistic_button b : bttns){
      b.display();
    }
  }
  
  void displayActivity(){
  
  }
  
  
  void displaySensors(){
  
  }
  
  
  
  void displayControls(){
    
  }
  
  /////
  
  /////
  
  /////
  
  void displayTelemetry(){
    background(0);

    a.display();
    b.display();
    
    sv.display();
    ov.display();
    
    fill(0,150,150,100);
   
    //groundvideo(5,0);
    
    fill(0,150,150,100);
    //groundvideo(12,0);
    
    fill(0, 255,255,50);
    
    fill(255,255,255,50);
    textSize(10);
    
    strokeWeight(1);
    for(gui_object o : lines){
      o.display();
    }
  }
}