class Sword extends AABB {
  PImage img;

  //Attributes
  float startingHitPoints = 3;
  float hitPoints = startingHitPoints;
  float timer = .5;
  float waitTimer = .5;
  boolean ready = false;
  boolean hitAnything = false;



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


    super.update();  
      


    //println(x);
  }

  void draw() {
    if (isDead == false) {

      pushMatrix();
      translate(x, y);
      rotate(radians(lerp(45, 360 + 90, timer))); // rotates object      
      fill(200);
      //noStroke();
      line(0, 0, 0 + w, 0);
      println(x);
      //println(y);


      //rect(0, 0, w, h);
      image(img, 0, 0, w, h);


      popMatrix();
      //stroke(1);
      fill(0);
    }
  }
}
