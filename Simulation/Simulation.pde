static float VertexRadius = 5;
static float SPRING_DAMPEN = 0.996;
static float SPRING_CONSTANT = 0.015;
<<<<<<< HEAD
static float GRAVITY = 1.5;
static int mode = 1;
=======
static float GRAVITY = .35;
static int mode = VERTEX_MODE;
static final int EDGE_MODE = 1;
static final int VERTEX_MODE = 0;

>>>>>>> c4935f1d2e2e198487538de0f4ccaa1b1862af94
public int displayMode = 0;
public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
public boolean Gravity = true;
void setup(){
  size(600, 600, P3D);
  frameRate(30);
  bodies.add(new SoftBody(300, 300, 5, 50, 3, 10, -1));
}

void draw(){
  background(200);
  bodies.get(0).react();
  bodies.get(0).display();
}

void mouseClicked(){
  
}
