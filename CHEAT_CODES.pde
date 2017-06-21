void cheatCodes(){
  if(kc('a') && kc('h') && kc('o') && kc('j')){
     exit();
  }
  if(kc('h') && kc('e') && kc('s') && kc('o') && kc('y') && kc('a') && kc('m')){
    
  }
  if(kc('p') && kc('r') && kc('e') && kc('v')&& kc('i')&& kc('o')&& kc('s')){
    actualLayout --;
  }
  if(kc('n') && kc('e') && kc('x') && kc('t')){
    actualLayout ++;
  }
  if(kc('r') && kc('o') && kc('c') && kc('k')&& kc('e')&& kc('t')){
    gL.gameLayout_state = "rocket creator";
  }
  
  if(kc('s') && kc('u') && kc('r') && kc('f')&& kc('a')&& kc('c') && kc('e')){
    gL.gameLayout_state = "planet surface";
  }
  
  if(kc('o') && kc('r') && kc('b') && kc('i')&& kc('t')){
    gL.gameLayout_state = "orbit control";
  }
  
}



boolean kc(char a){
  if(activeKeys.contains(a)){
    return true;
  }else{
    return false;
  }
}
void routines(){
  
  if(saveTime != 0){
    if(millis() >= saveTime){
      activeKeys.clear();
      saveTime = 0;
    }
  }
}