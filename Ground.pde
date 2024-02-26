class Ground extends AABB {
  
  //Attributes
  int startingHitPoints = 3;
  int hitPoints = startingHitPoints;
  
  Ground(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    velocity = new PVector();
    setSize(width, 150);
    
  }

  void update() {

    if (hitPoints <= 0) exit();

    

    //println(player.x);

    //calcAngleToMouse();

    

    //x += velocity.x * dt * sprint;
    //y += velocity.y * dt * sprint;

    //velocity.x *= 0.9;
    //velocity.y *= 0.9;
    // END FOCUS CODE

    // PREP FOR NEXT FRAME
    //println(x,y);
    super.update();
  }

  void draw() {
  fill(128 / 2 + 128);  
  //noStroke();
  rect(x, y, w, h); 
  //stroke(1);
  fill(0);
  }  
}
