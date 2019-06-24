ArrayList<Surface> surfaces = new ArrayList<Surface>();
Player p1;

void setup() {
  size(750, 500);
  ellipseMode(CENTER);
  p1 = new Player(0);
  createAllSurfaces();
}

void draw() {
  background(100, 190, 255);
  checkKeys();
  shape(p1.getCharacter());
  for(Surface s : surfaces) {
    shape(s.getShape());
    p1.move(s.getX(), s.getY());
  }
}

void createAllSurfaces() {
  // GROUND
  PShape g = createShape(RECT, 0, height - 50, width, 50);
  g.setFill(color(40, 120, 60));
  surfaces.add(new Surface(g, 0, height - 50));
}

void checkKeys() {
  if(keyPressed) {
    switch(keyCode) {
      case 37: p1.runLeft(); break;
      case 38: p1.jump(); break;
      case 39: p1.runRight(); break;
    }
  } else p1.stopRunning();
}

void keyReleased() {
  
}
