class Player extends AABB {
  float sprint;
  Boolean inAir;
  PImage img;
  PImage img2;
  float playerSpeed = 300;
  boolean isFocused = false;
  boolean isHovered = false;
  float groundLevel;
  boolean hasDouble = true;
  boolean canJump = true;



  //Attributes
  int startingHitPoints = 3;
  int hitPoints = startingHitPoints;




  Player(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    velocity = new PVector();
    setSize(100, 250);
    sprint = 1;
    groundLevel = y;
    inAir = false;
  }

  void update() {
    
    
    println(y);

    if (hitPoints <= 0) exit();

    velocity.y += GRAVITY * dt * 2;

    

    if (groundLevel <= y) {
      y = groundLevel;
      inAir = false;
    }

    //UPDATE INPUT ACTIONS IF THIS PLAYER IS IN FOCUS

    //println(player.x);

    //calcAngleToMouse();





    if (Keyboard.isDown(Keyboard.A)) {
      velocity.x = -playerSpeed;
    }
    if (Keyboard.isDown(Keyboard.D)) {
      velocity.x = playerSpeed;
    }
    if (Keyboard.isDown(Keyboard.SPACE)) {
      if (inAir == false) {
        velocity.y -= 3000;
        inAir = true;
      }
    }

    

    //if (Keyboard.isDown(Keyboard.W)) {
    //  velocity.y = -playerSpeed;
    //}
    //if (Keyboard.isDown(Keyboard.S)) {
    //  velocity.y = playerSpeed;
    //}


    if (Keyboard.isDown(Keyboard.SHIFT)) {
      sprint = 2;
    } else {
      sprint = 1;
    }

    x += velocity.x * dt * speedMultiplyer * sprint;
    y += velocity.y * dt * speedMultiplyer;

    velocity.x *= 0.9;
    velocity.y *= 0.9;
    // END FOCUS CODE

    // PREP FOR NEXT FRAME
    //println(x, y);
    super.update();
  }

  void draw() {
    //pushMatrix();
    //translate(x, y);
    //rotate(angle + PI/2);

    //if (!isFocused && isHovered)
    //{
    //  image(img2, -halfW, -halfH);
    //  popMatrix();
    //} else {
    //  image(img, -halfW, -halfH);
    //  popMatrix();
    //}

    rect(x, y, w, h);



    //stroke(2);
    //line(edgeL, edgeT, edgeL, edgeB);
    //line(edgeR, edgeT, edgeR, edgeB);
    //line(edgeL, edgeT, edgeR, edgeT);
    //line(edgeL, edgeB, edgeR, edgeB);
    //stroke(0);
  }

  //void checkHover() {
  //  float mx = camera.x + mouseX;
  //  float my = camera.y + mouseY;
  //  if (mx > x-halfW && mx < x + halfW && my > y-halfH && my < y + halfH) isHovered = true;
  //  else isHovered = false;
  //}
}
