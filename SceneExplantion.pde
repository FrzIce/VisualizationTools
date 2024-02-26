class SceneExplantion {

  SceneExplantion() {
  }

  void update() {
    boss.applicationMap = 1;
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - -50) && (mouseY > 595) && (mouseY < 695)) {
        switchToSword();
      }
      else if ((mouseX > 50) && (mouseX < 350) && (mouseY > 595) && (mouseY < 695)) {
        switchToHome();
      }
    }
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
    //print("yes");
  }

  void draw() {
    background(128);
    ground.draw();
    stroke(0);
    rect(50, 595, 300, 100);
    rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    textSize(30);
    textAlign(CENTER, TOP);
    text("Explantions!", width/2, 50);
  }
}
