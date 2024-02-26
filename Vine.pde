class Vine extends AABB {
  PImage img;

  //Attributes
  float startingHitPoints = 3;
  float hitPoints = startingHitPoints;
  float timer = 2;
  float waitTime;
  float originalX;

  Vine(float xPos, float yPos, int pattern) {
    x = xPos;
    y = yPos;
    velocity = new PVector();
    setSize(25, 250);
    if (pattern == 1) waitTime = .5;
    if (pattern == 2) waitTime = .6;
    if (pattern == 3) waitTime = .7;
    if (pattern == 4) waitTime = .8;
    if (pattern == 5) waitTime = .9;
    if (pattern == 6) waitTime = 1;
    img = loadImage("Vine.png");
    originalX = x;
  }

  void update() {
    waitTime -= dt;
    if (waitTime <= 0) {
      y -= 250 * dt;
      timer -= dt;
    }



    super.update();
  }

  void draw() {
    if (timer >= 0) {
      fill(200, 50, 0);
      rect(originalX, 220, w, 30);
      fill(200);
      //noStroke();
      //rect(x, y, w, h);
      image(img, x, y, w, h);
      //stroke(1);
      fill(0);
    }
  }
}
