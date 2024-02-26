class Dagger extends AABB {
  PImage img;

  //Attributes
  float startingHitPoints = 3;
  float hitPoints = startingHitPoints;
  float timer = 3;
  float angle;

  Dagger(float xPos, float yPos, float rotation) {
    x = xPos;
    y = yPos;
    angle = rotation;
    velocity = new PVector();
    setSize(50, 100);
    img = loadImage("Knife.png");
  }

  void update() {
    timer -= dt;
    if (timer <= 1) {
      velocity.x += 100;
      velocity.y -= 10;
      angle = 45;
      
      
    } else if (timer <= 2) {
      velocity.x += 50;
      velocity.y += 10;
      angle = -45;
    } else {
      velocity.x -= 150;
      angle = 90;
    }



    x += velocity.x * dt * speedMultiplyer;
    y += velocity.y * dt * speedMultiplyer;

    velocity.x *= 0.9;
    velocity.y *= 0.9;




    super.update();
  }

  void draw() {
    if (timer >= 0) {
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
