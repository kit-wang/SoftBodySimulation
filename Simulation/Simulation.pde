static float VertexRadius = 5;
static float SPRING_DAMPEN = .01;
static float SPRING_CONSTANT = 0.1;
static float GRAVITY = .4;
static final int EDGE_MODE = 1;
static final int VERTEX_MODE = 0;
static int mode = EDGE_MODE;
public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
public boolean Gravity = true;
public color VColor = color(0);
Boolean stop = false;
Vertex v1;
Vertex v2;
Vertex v3;
Edge e1;
Edge e2;
Edge e3;
int i = -150;


void setup() {

  size(800, 800, P3D);
  frameRate(20);
  v1 = new Vertex(300, 300, 0, 10, 0, 0);
  //bodies.add(new SoftBody(300, 300, 0, 100, 0, 50, 0));


  bodies.add(new SoftBody(600, 200, 0, 50, 5, 5, 0));
  //v1 = new Vertex(300, 300, 0, 10, 10, 0);
  //v2 = new Vertex(200, 200, 0, 0, 0, 0);
  //v3 = new Vertex(400, 200, 0, 0, 0, 0);
  //e1 = new Edge(v1, v2, 141);
  //e2 = new Edge(v1, v3, 141);
  //e3 = new Edge(v2, v3, 141);
}

void draw() {
  background(250);
  stroke(0);
  line(700, 100, -150, 700, 700, -150);
  line(700, 700, -150, 100, 700, -150);
  line(100, 100, -150, 700, 100, -150);
  line(100, 100, -150, 100, 700, -150);
  line(700, 100, 150, 700, 700, 150);
  line(700, 700, 150, 100, 700, 150);
  line(100, 100, 150, 700, 100, 150);
  line(100, 100, 150, 100, 700, 150);
  line(700, 100, 150, 700, 100, 150);
  line(100, 100, -150, 100, 100, 150);
  line(700, 700, -150, 700, 700, 150);
  line(700, 100, -150, 700, 100, 150);
  line(100, 700, -150, 100, 700, 150);
  for (int i = -150; i <= 150; i+=10) {
    line(450, 400, i, 700, 150, i);
  }
  
  if (!stop) {
    bodies.get(0).react();
    bodies.get(0).display();
  }
  //v1.move();
  //v1.display();
}

void mouseClicked() {
}
