void createLayout(int curr) {
  switch(curr) {
  case 0:
    MS.display();
    break;

  case 1:
    SP.display();
    break;

  case 2:
    gL.display();
    break;
  
  case 3:
    
    
    break;

  default:
    LDG.display();
    break;
    
  
  }

  /*fill(0, 255, 255);
  textAlign(RIGHT);
  textSize(10);
  text("SPACER ("+version+")", width-10, height-10);
  text(CONECTIVITY+" ", width-10, height-30);
  */
}
class grid_line {
  private int ID;
  private int sizeX, sizeY;
  private int posX, posY;


  public grid_line(int id, int px, int py, int sx, int sy) {
    ID = id;
    posX = px; 
    posY = py;

    sizeX = sx;
    sizeY = sy;
  }

  public void display() {
    stroke(255, 255, 255, 3);
    line(posX, posY, sizeX, sizeY);

    fill(255);
    textAlign(CENTER);
    //text(ID,posX+20, posY+25);
  }

  public void set_positions(int px, int py) {
    posX = px; 
    posY = py;
  }
}








void fileLoader(int findPath) {
  // Using just the path of this sketch to demonstrate,
  // but you can list any directory you like.
  String path = sketchPath();

  //println("Listing all filenames in a directory: ");
  //String[] filenames = listFileNames(path);
  //printArray(filenames);

  println("\nListing info about all files in a directory: ");
  File[] files = listFiles(path);
  for (int i = 0; i < files.length; i++) {
    File f = files[i];    
    println("Name: " + f.getName());
    println("Is directory: " + f.isDirectory());
    println("Size: " + f.length());
    String lastModified = new Date(f.lastModified()).toString();
    println("Last Modified: " + lastModified);
    println("-----------------------");
  }
}
// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

// This function returns all the files in a directory as an array of File objects
// This is useful if you want more info about the file
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}