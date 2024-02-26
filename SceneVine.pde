class SceneVine {

  SceneVine() {
  }

  void update() {
    background(128);
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.x + (width / 2), camera.scaleY); 
    
    camera.update();
    boss.applicationMap = 4;
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)) {
        switchToBolt();
      }
      else if ((mouseX > 50) && (mouseX < 350) && (mouseY > 595) && (mouseY < 695)) {
        switchToLance();
      }
    }
    boss.targetedZone = 3;
    boss.update();
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
  }

  void draw() {
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
    text("Vine", width/2, 50);
  }
}
