static float VertexRadius = 5;
static float SPRING_DAMPEN = 0.990;
static float SPRING_CONSTANT = 0.015;
static float GRAVITY = .35;
static int mode = 0;
Vertex v1;
Vertex v2;
Edge e1;


public int displayMode = 0;
public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
void setup(){
  size(600, 600, P3D);
  frameRate(30);
  v1 = new Vertex(300, 300, 20, 0, 0, 0);
  v2 = new Vertex(200, 200, -20, 0, 0, 0);
  e1 = new Edge(v1, v2, 50);
}

void draw(){
  background(200);
  e1.pull();
  v1.move();
  v2.move();
  v1.display();
  v2.display();
  e1.display();
}

void mouseClicked(){
}
