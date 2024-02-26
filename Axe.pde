class Axe extends AABB {

  //Attributes
  float startingHitPoints = 3;
  float hitPoints = startingHitPoints;
  float timer = .5;
  float waitTimer = .5;
  boolean ready = false;


  Axe(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    velocity = new PVector();
    setSize(150, 400);
  }

  void update() {

    if (waitTimer <= 0) ready = true;

    if (ready == false) {
      waitTimer -= dt;
    } else if (ready == true) {
      timer -= dt;
      if (timer <= 0) isDead = true;
    }



    super.update();
  }

  void draw() {
    if (isDead == false) {

      fill(255, 0, 3);
      //noStroke();
      pushMatrix();
      translate(x, y);
      rotate(radians(lerp(45, 360 + 90, timer))); // rotates object

      rect(0, 0, w, h);

      popMatrix();

      //stroke(1);
      fill(0);
    }
  }
}
