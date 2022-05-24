static float VertexRadius = 5;
static float SPRING_DAMPEN = 0.990;
static float SPRING_CONSTANT = 0.015;
static float GRAVITY = .35;
static final int EDGE_MODE = 1;
static final int VERTEX_MODE = 0;
static int mode = EDGE_MODE;

public int displayMode = 0;
public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
void setup(){
  size(600, 600, P3D);
  frameRate(30);
  bodies.add(new SoftBody(300, 300, 5, 50, 20, 40, 60));
}

void draw(){
  background(200);
  bodies.get(0).react();
  bodies.get(0).display();
}

void mouseClicked(){
  
}
