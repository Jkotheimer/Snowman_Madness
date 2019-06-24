class Body {
  
  private PShape body;
  
  public Body() {
    body = createShape(ELLIPSE, 35, 98, 50, 50);
    body.setFill(color(255));
  }
  
  public PShape getBody() { return body; }
}
