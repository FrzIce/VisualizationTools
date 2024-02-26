class Sword extends AABB {
  PImage img;

  //Attributes
  float startingHitPoints = 3;
  float hitPoints = startingHitPoints;
  float timer = .5;
  float waitTimer = .5;
  boolean ready = false;
  


  Sword(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    velocity = new PVector();
    setSize(50, 250);
    img = loadImage("Sword.png");
  }

  void update() {

    if (waitTimer <= 0) ready = true;

    if (ready == false) {
      waitTimer -= dt;
    } else if (ready == true) {
      timer -= dt;
      if (timer <= 0) isDead = true;
    }
    
    if (checkCollision(player)) {
      
    }



    super.update();
  }

  void draw() {
    if (isDead == false) {

      fill(200);
      //noStroke();
      pushMatrix();
      translate(x, y);
      rotate(radians(lerp(45, 360 + 90, timer))); // rotates object

      //rect(0, 0, w, h);
      image(img, 0, 0, w, h);

      popMatrix();

      //stroke(1);
      fill(0);
    }
  }
}
