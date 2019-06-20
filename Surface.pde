class Surface {
  
  private PShape shape;
  
  private float posX;
  private float posY;
  
  public Surface(PShape shape, float x, float y) {
    this.shape = shape;
    this.posX = x;
    this.posY = y;
  }
  
  public PShape getShape() { return shape; }
  public float getX() { return posX; }
  public float getY() { return posY; } //<>//
}
