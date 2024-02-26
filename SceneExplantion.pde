class SceneExplantion {
  PImage img;

  SceneExplantion() {
    img = loadImage("Tree_Base.png");
    player.hitPoints = player.startingHitPoints;
    boss.hitPoints = boss.startingHitPoints;
  }

  void update() {
    boss.applicationMap = 1;
    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      if ((mouseX > width - 350) && (mouseX < width - -50) && (mouseY > 595) && (mouseY < 695)) {
        switchToSword();
      } else if ((mouseX > 50) && (mouseX < 350) && (mouseY > 595) && (mouseY < 695)) {
        switchToHome();
      }
    }
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
    //print("yes");
  }

  void draw() {
    background(74, 90, 71);
    ground.draw();
    stroke(0);
    rect(50, 595, 300, 100);
    rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    textSize(50);
    textAlign(CENTER, TOP);
    text("Explantions!", width/2, 50);
    textSize(30);
    textAlign(LEFT, TOP);
    text("You must survive 26 seconds against the AI boss.", 30, 150);
    text("The boss will use 1 of 6 attacks every 3 seconds.", 30, 180);
    text("If the boss has more then half his HP,", 30, 210);
    text("It will swing a Sword, throw Lances, or summon Vines from the ground.", 30, 240);
    text("While if the boss has less then half his HP,", 30, 270);
    text("It will swing a Sword, swing an giant Axe, or summon a bolt of Lightning.", 30, 300);
    text("The boss will have a last ditch effot on its second to last attack,", 30, 330);
    text("It will throw a dagger to the player and it will fly back to the boss.", 30, 360);
    text("If this dagger hits your character then the Ai will gain 2 more attacks.", 30, 390);
    
    
    image(img, 1050, 100);
    
  }
}
