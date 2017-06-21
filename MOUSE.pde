void mouseWheel(MouseEvent event) {
  int directi = event.getCount();
  
  mouseWheelDirection = directi;
  //println(mouseWheelDirection);
  
  int direction = event.getCount()*10;
  if (direction > 0) {
    if (indexZ > -(height/1.3)) {
      indexZ -= direction;
    }
  } else {
    if (indexZ < height/1.6) {
      indexZ -= direction;
    }
  }
  

  //println(indexZ);
}

void mouseReleased(){
  doOne = false;
}