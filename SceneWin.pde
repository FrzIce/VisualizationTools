class SceneWin{
  
  SceneWin(){
    
  }
  
  void update(){
    boss.applicationMap = 9;
    
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)){
        exit();
      }
    }
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
  }
  
  void draw(){
    background(74, 90, 71);
    ground.draw();
    stroke(0);
    rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    textSize(40);
    textAlign(CENTER, TOP);
    text("You win!!", width/2, 50);
  }
}
