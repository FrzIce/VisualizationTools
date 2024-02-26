
class SceneHome {
  PImage img;

  SceneHome() {
    img = loadImage("TitleScreen.png");
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
    background(54, 60, 51);
    ground.draw();
    image(img, 0, 0, width, height - 150);

    fill(0);
    stroke(0);
    rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    fill(190);
    textSize(30);
    textAlign(CENTER, TOP);
    text("A guide through Decision Trees!", width/2, 195);
    fill(0);
  }
}
