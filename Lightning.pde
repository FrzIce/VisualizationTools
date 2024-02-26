class Lightning extends AABB {
  PImage img;

  //Attributes
  int startingHitPoints = 3;
  int hitPoints = startingHitPoints;
  float timer = 3;

  Lightning(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    velocity = new PVector();
    setSize(500, 100);
    img = loadImage("Lightning.png");
  }

  void update() {

    velocity.x -= 150;




    x += velocity.x * dt * speedMultiplyer;
    y += velocity.y * dt * speedMultiplyer;

    velocity.x *= 0.9;
    velocity.y *= 0.9;

    super.update();
  }

  void draw() {
    fill(200);
    //noStroke();
    image(img, x, y, w, h);
    //rect(x, y, w, h);
    //stroke(1);
    fill(0);
  }
}
