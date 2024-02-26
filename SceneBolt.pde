class SceneBolt{
  PImage img;
  
  SceneBolt(){
    img = loadImage("Tree_Bolt.png");
    
  }
  
  
  void update(){
    background(74, 90, 71);
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.x + 850, camera.scaleY); 
    
    camera.update();
    boss.applicationMap = 5;    
   
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)){
        switchToAxe();
      }
      else if ((mouseX > 50) && (mouseX < 350) && (mouseY > 595) && (mouseY < 695)) {
        switchToVine();
      }
    }
    boss.targetedZone = 3;
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
    text("Bolt", width/3 + 150, 50);  
    textSize(30);
    //textAlign(CENTER, TOP);
    text("The Ai will summon a bolt of lightning if it has less than 50% health,", width/3 + 150, 100);
    text("and you are in its far range!", width/3 + 150, 130);  
    image(img, 1050, 0);
  }
}
