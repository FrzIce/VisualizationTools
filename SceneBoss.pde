class SceneBoss{
 
  SceneBoss(){
    
  }
  
  
  
  void update(){
    background(128);
    // pushMatrix here.
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.x + (width / 2), camera.scaleY); 
    
    camera.update();
    boss.applicationMap = 8;
    
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)){
        switchToWin();
      }
      else if ((mouseX > 50) && (mouseX < 350) && (mouseY > 595) && (mouseY < 695)) {
        switchToDagger();
      }
    }
    
    //println(boss.sword.checkCollision(player));
    
    player.update();
    boss.update();
    //println(camera.y);
    
    //latepressed
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
    Keyboard.update();
    
    
  }
  
  void draw(){
    //background(128);    
    player.draw();
    boss.draw();
    
    popMatrix();
    
    //background(128);
    ground.draw();
    stroke(0);
    rect(50, 595, 300, 100);
    rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    textSize(40);
    textAlign(CENTER, TOP);
    text("BATTLE!!!", width/2, 50);
    
    
  }
}
