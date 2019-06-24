class Player {

  private PShape character = createShape(GROUP);
  private Head h = new Head();
  private Body b = new Body();
  private Bottom B = new Bottom();
  
  private final float accX = .5;
  private final float accY = 9.8;
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

  public PShape getCharacter() { return character; }

  public float getX() { return posX; }
  public float getY() { return posY; }
  
  public void move(float x, float y) {
    float leftSide = posX - B.getRadius();
    float rightSide = posX + B.getRadius();
    if(leftSide <= 0 && velX < 0) {
      character.translate(0 - leftSide, 0);
      posX -= leftSide;
    } else if(rightSide >= width && velX > 0) {
      character.translate(width - rightSide, 0);
      posX += width - rightSide;
    }
    else {
      character.translate(velX, 0);
      posX += velX;
    }
  }

  public void runLeft()  { if(abs(velX) < maxVelX) velX -= accX; }
  public void runRight() { if(abs(velX) < maxVelX) velX += accX; }
  public void jump()     { if(!inAir) velY = 20;   inAir = true; }

  public void stopRunning() { 
    if(velX > 0) {
      velX -= accX;
      if(velX < 0) velX = 0;
    }
    else if(velX < 0) {
      velX += accX;
      if(velX > 0) velX = 0;
    }
  }
}
