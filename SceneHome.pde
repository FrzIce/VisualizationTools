class SceneHome {

  SceneHome() {
  }

  void update() {
    boss.applicationMap = 0;
    
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)) {
        switchToExplantion();
      }
    }
    
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
  }

  void draw() {
    background(128);
    ground.draw();
    
    fill(0);
    stroke(0);
    rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    textSize(20);
    textAlign(CENTER, TOP);
    text("Press the button in the bottom to right to start!", width/2, 50);
  }
}
