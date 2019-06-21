class Player {

  private PShape character = createShape(GROUP);
  private Head h = new Head();
  private Body b = new Body();
  private Bottom B = new Bottom();

  private final float grav = 9.8;
  private final float accelX = .5;
  private final float maxSpeedX = 10.0;

  private float speedX = 0;
  private float speedY = 0;

  private float posX = 0;
  private float posY = 0;

  public Player(float initX) {
    character.addChild(h.getHead());
    character.addChild(h.getHat());
    character.addChild(b.getBody());
    character.addChild(B.getBottom());
    character.translate(initX, 0);
    posX = initX;
  }

  public PShape getCharacter() { 
    return character;
  }

  public float getX() { 
    return 0f;
  }
  
  public float getY() {
    return 0f;
  }

  public void fall() {
  }
  public void checkCollision(float x, float Y) {
    
  }

  public void runLeft() {
  }
  public void runRight() {
  }
  public void runUp() {
  }
  public void runDown() {
  }

  public void stopLeft() {
  }
  public void stopRight() {
  }
  public void stopUp() {
  }
  public void stopDown() {
  }
}
