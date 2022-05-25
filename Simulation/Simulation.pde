static float VertexRadius = 5;
static float SPRING_DAMPEN = 0.990;
static float SPRING_CONSTANT = 0.15;
static float GRAVITY = 1.5;
static final int EDGE_MODE = 1;
static final int VERTEX_MODE = 0;
static int mode = EDGE_MODE;
public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
public boolean Gravity = true;
public color VColor = color(0);
Vertex v1;
Vertex v2;
Edge e1;
Boolean stop = false;
void setup() {
  size(600, 600, P3D);
  frameRate(30);
  bodies.add(new SoftBody(300, 300, 5, 50, 10, 10, 0));
  v1 = new Vertex(300, 300, 0, 10, 10, 0);
  v2 = new Vertex(200, 200, 0, 0, 0, 0);
  e1 = new Edge(v1, v2, 141);
}

void draw() {
  if (!stop) {
    background(250);
    bodies.get(0).react();
    bodies.get(0).display();
  }
  //v1.move();
  //v2.move();
  //e1.pull();
  //v1.display();
  //v2.display();
  //e1.display();
}

void mouseClicked() {
}
