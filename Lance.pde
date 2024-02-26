class Lance extends AABB {
  PImage img;

  //Attributes
  float startingHitPoints = 3;
  float hitPoints = startingHitPoints;
  float timer = 1.5;
  float lifeTimer = 3;
  int direction; // 1 = straight, 2 = angle
  float angle;

  Lance(float xPos, float yPos, float rotation, int role) {
    x = xPos;
    y = yPos;
    angle = rotation;
    velocity = new PVector();
    setSize(50, 150);
    direction = role;
    img = loadImage("Lance.png");
  }

  void update() {
    timer -= dt;
    lifeTimer -= dt;

    if (direction == 1) {
      if (timer <= 1) {
        velocity.x -= 100;
      }
    } else if (direction == 2) {

      if (timer <= 0) {        
        velocity.y += 50;
      }
    }

    x += velocity.x * dt * speedMultiplyer;
    y += velocity.y * dt * speedMultiplyer;

    velocity.x *= 0.9;
    velocity.y *= 0.9;




    super.update();
  }

  void draw() {
    if (lifeTimer >= 0) {

      pushMatrix();
      translate(x, y);
      rotate(radians(angle));

      fill(200);
      //noStroke();

      //rect(0, 0, w, h);
      image(img, 0, 0, w, h);

      //stroke(1);
      fill(0);
      popMatrix();
    }
  }
}
