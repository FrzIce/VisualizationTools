// This is a project to help teach AI and Decision trees
// Copyright Trevor Baylie 2024



SceneHome sceneHome; //1
SceneExplantion sceneExplantion; //2
SceneSword sceneSword; //3
SceneLance sceneLance; //4
SceneVine sceneVine; //5
SceneBolt sceneBolt; //6
SceneAxe sceneAxe; //7
SceneDagger sceneDagger; //8
SceneBoss sceneBoss; //9
SceneWin sceneWin; //10
SceneLoss sceneLoss; //10


float dt = 0;
float prevTime = 0;
boolean leftPressed, rightPressed, pLeftPressed, pRightPressed;
boolean isGamePaused = false;
float speedMultiplyer = 1;
float GRAVITY = 981;

Ground ground;
Boss boss;
Player player, player2;
//Player camTarget;
Camera camera;

void setup() {
  size(1280, 720, P2D);
  noStroke();
  
  ground = new Ground(0, height - 150);
  player = new Player(0, 0);
  boss = new Boss(player.x + 1200, 0, player);
  camera = new Camera(player, boss);
  //player.isFocused = true;
  //player2 = new Player(width/2, height/2);
  
  
  switchToHome();
}

void draw() {
  //Every frame
  calcDeltaTime();
  if (sceneHome != null) { //1
    sceneHome.update();
    if (sceneHome != null) sceneHome.draw(); //made incase of scene switching
  } else if (sceneExplantion != null) { //2
    sceneExplantion.update();
    if (sceneExplantion != null) sceneExplantion.draw(); //made incase of scene switching
  } else if (sceneSword != null) { //3
    sceneSword.update();
    if (sceneSword != null) sceneSword.draw(); //made incase of scene switching
  } else if (sceneLance != null) { //4
    sceneLance.update();
    if (sceneLance != null) sceneLance.draw(); //made incase of scene switching
  } else if (sceneVine != null) { //5
    sceneVine.update();
    if (sceneVine != null) sceneVine.draw(); //made incase of scene switching
  } else if (sceneBolt != null) { //6
    sceneBolt.update();
    if (sceneBolt != null) sceneBolt.draw(); //made incase of scene switching
  } else if (sceneAxe != null) { //7
    sceneAxe.update();
    if (sceneAxe != null) sceneAxe.draw(); //made incase of scene switching
  } else if (sceneDagger != null) { //8
    sceneDagger.update();
    if (sceneDagger != null) sceneDagger.draw(); //made incase of scene switching
  } else if (sceneBoss != null) { //9
    sceneBoss.update();
    if (sceneBoss != null) sceneBoss.draw(); //made incase of scene switching
  } else if (sceneWin != null) { //10
    sceneWin.update();
    if (sceneWin != null) sceneWin.draw(); //made incase of scene switching
  } else if (sceneLoss != null) { //10
    sceneLoss.update();
    if (sceneLoss != null) sceneLoss.draw(); //made incase of scene switching
  }
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000;
  prevTime = currTime;
}

void switchToHome() {
  sceneHome = new SceneHome(); //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToExplantion() {
  sceneHome = null; //1
  sceneExplantion = new SceneExplantion(); //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToSword() {  
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = new SceneSword(); //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToLance() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = new SceneLance(); //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToVine() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = new SceneVine(); //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToBolt() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = new SceneBolt(); //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToAxe() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = new SceneAxe(); //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToDagger() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = new SceneDagger(); //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToBoss() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = new SceneBoss(); //9
  sceneWin = null; //10
  sceneLoss = null; //10
}

void switchToWin() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = new SceneWin(); //10
  sceneLoss = null; //10
}

void switchToLoss() {
  sceneHome = null; //1
  sceneExplantion = null; //2
  sceneSword = null; //3
  sceneLance = null; //4
  sceneVine = null; //5
  sceneBolt = null; //6
  sceneAxe = null; //7
  sceneDagger = null; //8
  sceneBoss = null; //9
  sceneWin = null; //10
  sceneLoss = new SceneLoss(); //10
}

void mousePressed() {
  if (mouseButton == LEFT) leftPressed = true;
  if (mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if (mouseButton == LEFT) leftPressed = false;
  if (mouseButton == RIGHT) rightPressed = false;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}
