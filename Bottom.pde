class Bottom {
  
  private PShape bottom;
  
  public Bottom() {
    bottom = createShape(ELLIPSE, 0, 125, 70, 70);
    bottom.setFill(color(255));
  }
  
  public PShape getBottom() { return bottom; }
}
