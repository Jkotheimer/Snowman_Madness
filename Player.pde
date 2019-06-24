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

  public Player(float initX) {
    character.addChild(h.getHead());
    character.addChild(h.getHat());
    character.addChild(b.getBody());
    character.addChild(B.getBottom());
    character.translate(initX, 0);
    posX = initX + B.getRadius();
  }

  public PShape getCharacter() { 
    return character;
  }

  public float getX() { 
    return posX;
  }
  public float getY() { 
    return posY;
  }

  public void move(float x, float y) {
    float leftSide = posX - B.getRadius();
    float rightSide = posX + B.getRadius();
    float bottomSide = posY + B.getLowPoint();
    velY += accY;

    // First, we want to check for running into the edge of the object
    if (leftSide <= 0 && velX < 0) {
      character.translate(0 - leftSide, 0);
      posX -= leftSide;
      velX = abs(velX);
    } else if (rightSide >= x && velX > 0) {
      character.translate(x - rightSide, 0);
      posX += x - rightSide;
      velX = abs(velX) * -1;
    } else {
      character.translate(velX, 0);
      posX += velX;
    }
    
    // Next, we wanna check for landing on an object
    if (posY <= 0 && velY < 0) {
      character.translate(0, 0 - posY);
      posY -= leftSide;
      //velY = abs(velY);
    } else if (bottomSide >= y && velY > 0) {
      character.translate(0, y - bottomSide);
      posY += y - bottomSide;
      if(velY < .785) {
        velY = 0;
        inAir = false;
      } 
      println(velY);
      velY = abs(velY) * -.25;
    } else {
      character.translate(0, velY);
      posY += velY;
    }
  }

  public void runLeft() { if(abs(velX) < maxVelX || velX > 0) velX -= accX; }
  public void runRight(){ if(abs(velX) < maxVelX || velX < 0) velX += accX; }
  public void jump() { 
    if (!inAir) velY = 70;   
    inAir = true;
  }

  public void stopRunning() { 
    if (velX > 0) {
      velX -= accX * 2;
      if (velX < 0) velX = 0;
    } else if (velX < 0) {
      velX += accX * 2;
      if (velX > 0) velX = 0;
    }
  }
}
