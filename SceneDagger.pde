class SceneDagger{
  PImage img;
  
  SceneDagger(){
    img = loadImage("Tree_Dagger.png");
    
  }
  
  void update(){
    background(74, 90, 71);
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.x + 850, camera.scaleY); 
    
    camera.update();
    boss.applicationMap = 7;
    
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)){
        switchToBoss();
      }
      else if ((mouseX > 50) && (mouseX < 350) && (mouseY > 595) && (mouseY < 695)) {
        switchToAxe();
      }
    }    
    boss.targetedZone = 4;
    boss.update();
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
  }
  
  void draw(){
    boss.draw();
    popMatrix();
    
    ground.draw();
    stroke(0);
    rect(50, 595, 300, 100);
    rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    textSize(40);
    textAlign(CENTER, TOP);
    text("Dagger", width/3 + 150, 50);
    textSize(30);
    //textAlign(CENTER, TOP);
    text("The Ai will throw its dagger at you if it is second to last attack!", width/3 + 150, 100);
    text("If the dagger hits you, the Ai will gain more time alive and will get more attacks!", width/3 + 150, 130);
    image(img, 1050, 0);
  }
}
