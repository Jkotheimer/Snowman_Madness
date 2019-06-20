class Head {
  
  private PShape head, hat;
  
  public Head() {
    
    head = createShape(GROUP);
    hat = createShape(GROUP);
    PShape top, brim, nose, eye, face;
    
    face = createShape(ELLIPSE, 20, 45, 30, 30);
    face.setFill(color(255));
    
    eye = createShape(RECT, 37, 55, 5, 5);
    eye.setFill(color(50));
    
    nose = createShape(TRIANGLE, 50, 57, 50, 65, 70, 61);
    nose.setFill(color(240, 150, 60));
    
    head.addChild(face);
    head.addChild(eye);
    head.addChild(nose);
    
    top = createShape(RECT, 25, 0, 20, 50);
    top.setFill(color(0));
    brim = createShape(RECT, 10, 45, 50, 5);
    brim.setFill(color(0));
    
    hat.addChild(top);
    hat.addChild(brim);
  }
  
  public PShape getHead() { return head; }
  public PShape getHat()  { return hat;  }
}
