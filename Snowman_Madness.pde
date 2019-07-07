ArrayList<Surface> surfaces = new ArrayList<Surface>();
Player p1;

void setup() {
  size(1000, 500);
  ellipseMode(CENTER);
  p1 = new Player(0);
  createAllSurfaces();
}

void draw() {
  background(100, 190, 255);
  shape(p1.getCharacter());
  for(Surface s : surfaces) {
    shape(s.getShape());
    p1.move(s.getX(), s.getY(), s.getWidth(), s.getHeight());
  }
}

void createAllSurfaces() {
  // GROUND
  PShape g = createShape(RECT, 0, height - 50, width, 50);
  g.setFill(color(40, 120, 60));
  surfaces.add(new Surface(g, 0, height - 50));
  
  // BAD GUY
  PShape badGuy = createShape(ELLIPSE, 200, 300, 100, 50);
  surfaces.add(new Surface(badGuy, 200, 300));
}

void keyPressed() {
  switch(keyCode) {
    case 37: p1.runLeft(); break;
    case 38: p1.jump(); break;
    case 39: p1.runRight(); break;
  }
  println(keyCode);
}

void keyReleased() {
  if(keyCode == 37 || keyCode == 39) p1.stop();
  if(keyCode == 37) p1.stopLeft();
  if(keyCode == 39) p1.stopRight();
}
