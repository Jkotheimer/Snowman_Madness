ArrayList<Surface> surfaces = new ArrayList<Surface>();
Player p1;

void setup() {
  size(750, 500);
  ellipseMode(CORNER);
  p1 = new Player(0);
  createAllSurfaces();
}

void draw() {
  background(100, 190, 255);
  shape(p1.getCharacter());
  for(Surface s : surfaces) {
    shape(s.getShape());
    p1.fall();
  }
}

void createAllSurfaces() {
  // GROUND
  PShape g = createShape(RECT, 0, height - 50, width, 50);
  g.setFill(color(40, 120, 60));
  surfaces.add(new Surface(g, 0, height - 50));
}

void keyPressed() {
  if(keyCode == 37) p1.runLeft();
  if(keyCode == 38) p1.runUp();
  if(keyCode == 39) p1.runRight();
  if(keyCode == 40) p1.runDown();
}

void keyReleased() {
  if(keyCode == 37) p1.stopLeft();
  if(keyCode == 38) p1.stopUp();
  if(keyCode == 39) p1.stopRight();
  if(keyCode == 40) p1.stopDown();
}
