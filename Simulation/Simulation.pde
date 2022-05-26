static float VertexRadius = 5;
static float SPRING_DAMPEN = 0.1;
static float SPRING_CONSTANT = 0.15;
static float GRAVITY = .35;
static final int EDGE_MODE = 1;
static final int VERTEX_MODE = 0;
static int mode = EDGE_MODE;
public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
public boolean Gravity = true;
public color VColor = color(0);
Boolean stop = false;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
  bodies.add(new SoftBody(300, 300, 0, 100, 0, 0, 0));
}

void draw() {
  background(250);
  if (!stop) {
    background(250);
    bodies.get(0).react();
    bodies.get(0).display();
  }
}

void mouseClicked() {
}
