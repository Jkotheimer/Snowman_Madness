class Body {
  
  private PShape body;
  
  public Body() {
    body = createShape(ELLIPSE, 10, 75, 50, 50);
    body.setFill(color(255));
  }
  
  public PShape getBody() { return body; }
}
