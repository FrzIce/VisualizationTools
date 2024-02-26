class SceneBoss {
  PImage img;

  SceneBoss() {
    img = loadImage("Tree_Base.png");
  }



  void update() {
    background(74, 90, 71);
    // pushMatrix here.
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.x + width / 2 + 250, camera.scaleY);

    camera.update();
    boss.applicationMap = 8;

    if (leftPressed && !pLeftPressed) {//if mouse clicked in certain area, will progress through scenes
      //if ((mouseX > width - 350) && (mouseX < width - 50) && (mouseY > 595) && (mouseY < 695)){
      //  switchToWin();
      //}
      if ((mouseX > 50) && (mouseX < 350) && (mouseY > 595) && (mouseY < 695)) {
        switchToExplantion();
      }
    }

    //println(boss.sword.checkCollision(player));

    player.update();
    boss.update();
    
    if (boss.lastUsedAttack == 1){
      img = loadImage("Tree_SwordHigher.png");
    }
    else if (boss.lastUsedAttack == 2){
      img = loadImage("Tree_SwordLower.png");
    }
    else if (boss.lastUsedAttack == 3){
      img = loadImage("Tree_Lance.png");
    }
    else if (boss.lastUsedAttack == 4){
      img = loadImage("Tree_Vine.png");
    }
    else if (boss.lastUsedAttack == 5){
      img = loadImage("Tree_Axe.png");
    }
    else if (boss.lastUsedAttack == 6){
      img = loadImage("Tree_Bolt.png");
    }
    else if (boss.lastUsedAttack == 7){
      img = loadImage("Tree_Dagger.png");
    }
    else {
      img = loadImage("Tree_Base.png");
    }


    //println(camera.y);

    //latepressed
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
    Keyboard.update();
  }

  void draw() {
    //background(128);
    player.draw();
    boss.draw();

    popMatrix();

    //background(128);
    ground.draw();
    stroke(0);
    rect(50, 595, 300, 100);
    //rect(width - 350, 595, 300, 100);
    strokeWeight(3);
    line(0, height - 150, width, height - 150);
    textSize(40);
    textAlign(CENTER, TOP);
    text("BATTLE!!!", width/2, 50);
    fill(200,0,0);
    text(int(boss.hitPoints), 1150, 15);
    image(img, 1050, 0);
    fill(0);
  }
}
