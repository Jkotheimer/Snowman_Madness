class Bottom {
  
  private PShape bottom;
  private final float radius = 35;
  private final float lowPoint = 155 + radius;
  
  public Bottom() {
    bottom = createShape(ELLIPSE, 35, 155, radius * 2, radius * 2);
    bottom.setFill(color(255));
  }
  
  public PShape getBottom() { return bottom; }
  
  public float getRadius() { return radius; }
  public float getLowPoint() { return lowPoint; }
}
