class Player {

  private PShape character = createShape(GROUP);
  private Head h = new Head();
  private Body b = new Body();
  private Bottom B = new Bottom();

  private final float accX = .5;
  private final float accY = 0.98;
  private boolean inAir = true;

  private float velX = 0;
  private float velY = 0;
  private final float maxVelX = 10.0;

  private float posX = 0;
  private float posY = 0;
  
  private boolean movingLeft = false;
  private boolean deccelLeft = false;
  private boolean movingRight = false;
  private boolean deccelRight = false;

  public Player(float initX) {
    character.addChild(h.getHead());
    character.addChild(h.getHat());
    character.addChild(b.getBody());
    character.addChild(B.getBottom());
    character.translate(initX, 0);
    posX = initX + B.getRadius();
  }

  public PShape getCharacter() { return character; }

  public float getX() { return posX; }
  public float getY() { return posY; }

  public void move(float x, float y, float w, float h) {
    float leftSide = posX - B.getRadius();
    float rightSide = posX + B.getRadius();
    float bottomSide = posY + B.getLowPoint();
    velY += accY;
    
    if(movingLeft && abs(velX) < maxVelX || deccelRight && velX > 0) { 
      velX -= accX;
      if(deccelRight && velX < 0) {
        deccelRight = false;
        velX = 0;
      }
    }
    if(movingRight && abs(velX) < maxVelX || deccelLeft && velX < 0) {
      velX += accX;
      if(deccelLeft && velX > 0) { 
        deccelLeft = false;
        velX = 0;
      }
    }
    checkCollision(leftSide, rightSide, x, w);
    checkLanding(bottomSide, y, h);
  }
  
  private void checkCollision(float leftSide, float rightSide, float x, float w) {
    if (leftSide < 0 && velX < 0) {
      character.translate(0 - leftSide, 0);
      posX = 0 + B.getRadius();
      velX = 0;
      stop();
    } else if (rightSide >= (width * .66) && velX > 0) {
      character.translate((width * .66) - rightSide, 0);
      posX = (width * .66) - B.getRadius();
      velX = 0;
      stop();
    } else {
      character.translate(velX, 0);
      posX += velX;
    }
  }
  
  private void checkLanding(float bottomSide, float y, float h) {
    /* We wanna check for landing on an object
        If the bottom of the player hits the current surface and the player is falling, give a lil bounce*/
    if (bottomSide >= y && velY > 0) {
      character.translate(0, y - bottomSide);
      posY += y - bottomSide;
      if(velY < .785) {
        velY = 0;
        inAir = false;
      } 
      velY = abs(velY) * -.25;
    } else {
      character.translate(0, velY);
      posY += velY;
    }
  }

  public void stop() { movingLeft = false; movingRight = false; deccelLeft = false; deccelRight = false; }
  public void runLeft() { movingLeft = true; movingRight = false; deccelLeft = false; deccelRight = false; }
  public void stopLeft() { movingLeft = false; movingRight = false; deccelLeft = true; deccelRight = false; }
  public void runRight() { movingRight = true; movingLeft = false; deccelLeft = false; deccelRight = false; }
  public void stopRight() { movingRight = false; movingLeft = false; deccelLeft = false; deccelRight = true; }
  
  public void jump() { 
    if (!inAir) velY = 70;   
    inAir = true;
  }
}
