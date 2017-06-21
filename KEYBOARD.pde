void keyPressed() {
  
  
  saveTime = millis()+1000;
  activeKeys.add(key);
  cheatCodes();
  
  switch(key) {
  case 'ě':
    if (!doOne) {
      doOne = !doOne;
      createClient();
    }
    break;

  case '+':
    if (!doOne) {
      doOne = !doOne;
      createServer();
    }
    break;
  }
  if (key == 'f') {
    if (DEF_dev_gui) {
      DEF_dev_gui = false;
    } else {
      DEF_dev_gui = true;
    }
  }
  switch(keyCode) {
  case UP:
    keys[0] = true;
    break;

  case DOWN:
    keys[1] = true;
    break;

  case LEFT:
    keys[2] = true;
    break;

  case RIGHT:
    keys[3] = true;
    break;
  }
}

void checkKeyboard() {

  if (keys[0]) {  
    gL.move(UP);
  }
  if (keys[1]) {  
    gL.move(DOWN);
  }
  if (keys[2]) {  
    gL.move(LEFT);
  }
  if (keys[3]) {  
    gL.move(RIGHT);
  }
}

void keyReleased() {
  doOne = false;

  switch(keyCode) {
  case UP:
    keys[0] = false;
    break;

  case DOWN:
    keys[1] = false;
    break;

  case LEFT:
    keys[2] = false;
    break;

  case RIGHT:
    keys[3] = false;
    break;
  }
}