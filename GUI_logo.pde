
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////                                           /////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

class logo {
  ArrayList<logo_points> points = new ArrayList<logo_points>();

  boolean canBeAdded;

  int dista = 25;

  int positionX;
  int positionY;

  int sizeX;
  int sizeY;


  public logo() {
    positionX = width/2;
    positionY = height/6;

    sizeX = width/2;
    sizeY = (height/6)*2;
    
    points.add(new logo_points(1, -225, 63));
    points.add(new logo_points(1, -167, 12));
    points.add(new logo_points(1, -232, -26));
    points.add(new logo_points(1, -164, -49));
    points.add(new logo_points(2, -147, -49));
    points.add(new logo_points(2, -76, -18));
    points.add(new logo_points(2, -140, 8));
    points.add(new logo_points(2, -141, 43));
    points.add(new logo_points(3, -80, 50));
    points.add(new logo_points(3, -43, -48));
    points.add(new logo_points(3, -10, 50));
    points.add(new logo_points(4, 57, -44));
    points.add(new logo_points(4, -4, -3));
    points.add(new logo_points(4, 56, 38));
    points.add(new logo_points(5, 130, -49));
    points.add(new logo_points(5, 84, -48));
    points.add(new logo_points(5, 127, -4));
    points.add(new logo_points(5, 89, 40));
    points.add(new logo_points(5, 133, 38));
    points.add(new logo_points(6, 162, 56));
    points.add(new logo_points(6, 161, -50));
    points.add(new logo_points(6, 217, -16));
    points.add(new logo_points(6, 170, 1));
    points.add(new logo_points(6, 247, 68));
    
  }

  void display() {

    stroke(0, 255, 255,transLO);
    fill(255, 255, 255, 0);
    
    for (int i = 1; i < points.size(); i++) {
      if (points.get(i-1).ID == points.get(i).ID) {
        line(points.get(i).positionX+MS.logoposX, points.get(i).positionY+MS.logoposY, points.get(i-1).positionX+MS.logoposX, points.get(i-1).positionY+MS.logoposY);
      }
      points.get(0).display();
      points.get(i).display();
    }
  }
}