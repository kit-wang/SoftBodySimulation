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
Vertex v1;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
<<<<<<< HEAD
  v1 = new Vertex(300, 300, 0, 0, 50, 0);
  //bodies.add(new SoftBody(300, 300, 0, 100, 0, 50, 0));
=======
  bodies.add(new SoftBody(300, 300, 0, 50, 0, 15, 0));
  v1 = new Vertex(300, 300, 0, 10, 10, 0);
  v2 = new Vertex(200, 200, 0, 0, 0, 0);
  v3 = new Vertex(400, 200, 0, 0, 0, 0);
  e1 = new Edge(v1, v2, 141);
  e2 = new Edge(v1, v3, 141);
  e3 = new Edge(v2, v3, 141);
>>>>>>> 28d13687987142bb5e770ecba47ceaafda07861b
}

void draw() {
  background(250);
  /*if (!stop) {
    background(250);
    bodies.get(0).react();
    bodies.get(0).display();
  }*/
  v1.move();
  v1.display();
}

void mouseClicked() {
}
