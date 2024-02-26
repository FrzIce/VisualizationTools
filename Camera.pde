class Camera { //get distance between player and boss and make the middle where camera is situated, minus by half H and W in boss tab
  float x; //camera's positions
  float px; //player's positions
  float bx; //boss's positions
  //float tx, ty;
  //float distance;
  Player pTarget;
  Boss bTarget;
  //float dx, dy;
  boolean inFight = false;
  float zoom = 1;
  float scaleY = 320;

  Camera(Player p, Boss b) {
    //px = p.x;
    //py = p.y;
    //bx = b.x;
    //by = b.y;
    pTarget = p;
    bTarget = b;
    //tx = target.x - width/2;
    //ty = target.y - height/2;
    //x = tx;
    if (p.x < b.x) {
      x = p.x + ((b.x - p.x) / 2 + (125/2));
    } else if (p.x > b.x) {
      x = b.x + ((p.x - b.x) / 2 + (125/2));
    } else if (p.x == b.x) {
      x = p.x;
    }
  }

  void update() {

    px = pTarget.x;
    bx = bTarget.x;
    inFight = bTarget.inFight;
    
    if (zoom == .7){
      scaleY = 565;
    }
    else {
      scaleY = 630;
    }


    if (inFight) {
      zoom = .7;
      if (px < bx) {
        x = px + ((bx - px) / 2 + (125 / 2));
        //println("testing");
      } else if (px > bx) {
        x = bx + ((px - bx) / 2 - (125 / 2));
        //println("testing");
      } else if (px == bx) {
        x = px;
        //println("testing");
      }
    }
    else if (!inFight){
      zoom = .65;
      x = bx - width / 2 + - 150;
    }

    //tx = target.x - width/2;
    //ty = target.y - height/2;
    //dx = tx - x;
    //dy = ty - y;
    //distance = sqrt(dx*dx + dy*dy);

    ////target.x <= -480
    ////target.y >= 780
    //if (target.x <= -700) {
    //} else if (target.x >= 700) {
    //} else x += dx * 0.1;

    //if (target.y >= 760) {
    //} else if (target.y <= -760) {
    //} else y += dy * 0.1;


    //println(x);
  }
}
