static float VertexRadius = 5;
static float SPRING_DAMPEN = 0.996;
static float SPRING_CONSTANT = 0.015;
static float GRAVITY = 1.5;
static final int EDGE_MODE = 1;
static final int VERTEX_MODE = 0;
static int mode = EDGE_MODE;

public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
public boolean Gravity = true;
public color VColor = color(255);
void setup(){
  size(600, 600, P3D);
  frameRate(30);
  bodies.add(new SoftBody(300, 300, 5, 50, 3, 10, -1));
}

void draw(){
  background(100);
  bodies.get(0).react();
  bodies.get(0).display();
}

void mouseClicked(){

}
