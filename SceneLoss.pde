class SceneLoss {

  SceneLoss() {
  }

  void update() {
    boss.applicationMap = 10;

    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)) {
        exit();
      }
    }

    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
  }

  void draw() {
    background(74, 90, 71);
    ground.draw();
    rect(width - 350, 595, 300, 100);
    //rect(150, 450, 300, 150);
    //rect(width - 450, 450, 300, 150);
    textSize(40);
    textAlign(CENTER, TOP);
    text("You lose!", width/2, 50);
  }
}
