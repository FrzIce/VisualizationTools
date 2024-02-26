class Boss extends AABB {

  PImage img;
  float zoneCloseStart;
  float zoneCloseEnd;
  float zoneMidStart;
  float zoneMidEnd;
  boolean inFight = false;
  boolean daggerAttack = false;
  float attackTimer = 3;
  int applicationMap; //0 - Home, 1 - Explantion, 2 - Sword, 3 - Lance, 4 - Vines, 5 - Lightning, 6 - Axe, 7 - Dagger, 8 - Boss, 9 - Win, 10 - Loss
  int pApplicationMap;
  boolean pInFight = false;
  int targetedZone; // 1 - close, 2 - mid, 3 - long
  Player pTarget;
  int lastUsedAttack; // 0 - base, 1 - swordHigher, 2 - swordLower, 3 - lance, 4 - vine, 5 - axe, 6 - bolt, 7 - dagger
  //creates the weapons used for attacking
  Sword sword;
  Lance lance;
  Lance lanceAngle;
  Vine vine1;
  Vine vine2;
  Vine vine3;
  Vine vine4;
  Vine vine5;
  Vine vine6;
  Lightning bolt;
  Axe axe;
  Dagger dagger;
  Dagger daggerAngle;

  //Attributes
  float startingHitPoints = 26;
  float hitPoints = startingHitPoints;

  Boss(float xPos, float yPos, Player p) {
    x = xPos;
    y = yPos;
    velocity = new PVector();
    setSize(100, 250);
    zoneCloseStart = ((x + halfW) - 400);
    zoneCloseEnd = ((x + halfW) + 400);
    zoneMidStart = ((x + halfW) - 1000);
    zoneMidEnd = ((x + halfW) + 1000);
    pTarget = p;
    img = loadImage("Boss.png");
    lastUsedAttack = 0;
  }

  void setup() {
  }

  void update() {

    if (pApplicationMap != applicationMap)
    {
      targetedZone = 0;
      inFight = false;
      attackTimer = 1;
      sword = null;
      lance = null;
      lanceAngle = null;
      vine1 = null;
      vine2 = null;
      vine3 = null;
      vine4 = null;
      vine5 = null;
      vine6 = null;
      axe = null;
      bolt = null;
      dagger = null;
    }

    if (applicationMap == 8 && pApplicationMap != applicationMap) {
      inFight = true;
      attackTimer = 3;
    }




    if (hitPoints <= 0) switchToWin();

    //println(hitPoints);
    println(attackTimer);

    if (inFight == true) { //main tree when boss in in play, so sceneBoss
      hitPoints -= dt;
      attackTimer -= dt;
      if (attackTimer <= 0) {
        if ((daggerAttack == false) && (hitPoints <= (startingHitPoints / 5))) { // checks if dagger attack has been used yet
          dagger = new Dagger(x + w, 0, 0);
          lastUsedAttack = 7;
          daggerAttack = true; //prevents daggers from being used again
        } else if (hitPoints <= (startingHitPoints / 2)) { // if boss has less then half hp
          if ((player.x + w >= zoneCloseStart) && (player.x + w <= zoneCloseEnd)) { //SWORD
            sword = new Sword(x - 20, 0);
            lastUsedAttack = 2;
          } else if ((player.x + w >= zoneMidStart) && (player.x + w <= zoneMidEnd)) { //AXE
            axe = new Axe(player.x + player.w / 2 + 300, -30);
            lastUsedAttack = 5;
          } else { //LIGHTNING BOLT!!!!
            bolt = new Lightning(x + w, 100);
            lastUsedAttack = 6;
          }
        } else {
          //println("maybe");
          if ((player.x + w >= zoneCloseStart) && (player.x + w <= zoneCloseEnd)) { //SWORD
            sword = new Sword(x - 20, 0);
            lastUsedAttack = 1;
          } else if ((player.x + w >= zoneMidStart) && (player.x + w <= zoneMidEnd)) { //LANCE
            println("lances");
            lance = new Lance(x + w + 50, 60, 90, 1);
            lanceAngle = new Lance(player.x + player.w / 2, -300, 0, 2);
            lastUsedAttack = 3;
          } else { //VINES
            vine1 = new Vine((player.x - (250 * 3)), 500, 1);
            vine2 = new Vine((player.x - (250 * 2)), 500, 2);
            vine3 = new Vine((player.x - (250 * 1)), 500, 3);
            vine4 = new Vine(player.x, 500, 4);
            vine5 = new Vine((player.x + (250 * 1)), 500, 5);
            vine6 = new Vine((player.x + (250 * 2)), 500, 6);
            lastUsedAttack = 4;
          }
        }
        attackTimer = 3;
      }
    } else if (applicationMap == 2) { //Sword
      if (attackTimer <= 0) {
        sword = new Sword(x - 20, 0);
        attackTimer = 3;
      }
      attackTimer -= dt;
    } else if (applicationMap == 3) { //Lance
      if (attackTimer <= 0) {
        lance = new Lance(x + w + 50, 60, 90, 1);
        lanceAngle = new Lance(x - 600, -300, 0, 2);
        attackTimer = 3;
      }
      attackTimer -= dt;
    } else if (applicationMap == 4) { //Vine
      if (attackTimer <= 0) {
        vine1 = new Vine(((x + halfW) - (250 * 1)), 500, 1);
        vine2 = new Vine(((x + halfW) - (250 * 2)), 500, 2);
        vine3 = new Vine(((x + halfW) - (250 * 3)), 500, 3);
        vine4 = new Vine(((x + halfW) - (250 * 4)), 500, 4);
        vine5 = new Vine(((x + halfW) - (250 * 5)), 500, 5);
        vine6 = new Vine(((x + halfW) - (250 * 6)), 500, 6);
        attackTimer = 3;
      }
      attackTimer -= dt;
    } else if (applicationMap == 5) { //Bolt
      if (attackTimer <= 0) {
        bolt = new Lightning(x + w, 100);
        attackTimer = 3;
      }
      attackTimer -= dt;
    } else if (applicationMap == 6) { //Axe
      if (attackTimer <= 0) {
        axe = new Axe(x - 200, -30);
        attackTimer = 3;
      }
      attackTimer -= dt;
    } else if (applicationMap == 7) { //Dagger
      if (attackTimer <= 0) {
        dagger = new Dagger(x + w, 0, 0);
        attackTimer = 3;
      }
      attackTimer -= dt;
    }




    if (sword != null)
    {
      sword.update();
      println("test");
      if (sword.checkCollision(pTarget)) {
        println("took Damage");
        player.velocity.x -= 500;
      }
    }
    if (lance != null) lance.update();
    if (lanceAngle != null) lanceAngle.update();
    if (vine1 != null) vine1.update();
    if (vine2 != null) vine2.update();
    if (vine3 != null) vine3.update();
    if (vine4 != null) vine4.update();
    if (vine5 != null) vine5.update();
    if (vine6 != null) vine6.update();
    if (axe != null) axe.update();
    if (bolt != null) bolt.update();
    if (dagger != null) dagger.update();













    //x += velocity.x * dt * sprint;
    //y += velocity.y * dt * sprint;

    //velocity.x *= 0.9;
    //velocity.y *= 0.9;
    // END FOCUS CODE

    // PREP FOR NEXT FRAME
    //println(x,y);
    pInFight = inFight;
    pApplicationMap = applicationMap;
    super.update();
  }

  void draw() {
    //Boss body
    fill(255, 0, 0);
    //rect(x, y, w, h);
    image(img, x, y, w, h);
    //noStroke();
    //draw skills
    if (sword != null) sword.draw();
    if (lance != null) lance.draw();
    if (lanceAngle != null) lanceAngle.draw();
    if (vine1 != null) vine1.draw();
    if (vine2 != null) vine2.draw();
    if (vine3 != null) vine3.draw();
    if (vine4 != null) vine4.draw();
    if (vine5 != null) vine5.draw();
    if (vine6 != null) vine6.draw();
    if (axe != null) axe.draw();
    if (bolt != null) bolt.draw();
    if (dagger != null) dagger.draw();



    //Zone 1
    stroke(128, 64, 64);
    line(zoneCloseStart, 200, zoneCloseStart, 250);
    //line(zoneCloseEnd, 200, zoneCloseEnd, 250);

    //Zone 2
    stroke(64, 32, 32);
    line(zoneMidStart, 200, zoneMidStart, 250);
    //line(zoneMidEnd, 200, zoneMidEnd, 250);

    //Explantions target zones
    fill(255, 50, 50);
    if (targetedZone == 1) {
      rect(zoneCloseStart, 225, x - zoneCloseStart, 50);
      //rect(x + w, 225, zoneCloseEnd - (x + w), 50);
    } else if (targetedZone == 2) {
      rect(zoneMidStart, 225, zoneCloseStart - zoneMidStart, 50);
      //rect(zoneCloseEnd, 225, zoneMidEnd - zoneCloseEnd, 50);
    } else if (targetedZone == 3) {
      rect(zoneMidStart - 500, 225, 500, 50);
      //rect(zoneMidEnd, 225, 500, 50);
    } else {
    }


    stroke(1);
    fill(0);
  }
}
