class SceneLoss{
  
  SceneLoss(){
    
  }
  
  void update(){
    boss.applicationMap = 10;
    
    
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
  }
  
  void draw(){
    background(128);
    ground.draw();
    //rect(150, 450, 300, 150);
    //rect(width - 450, 450, 300, 150);
    textSize(40);
    textAlign(CENTER, TOP);
    text("You lose!", width/2, 50);
  }
}
