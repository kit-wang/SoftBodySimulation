static float VertexRadius = .1;
static float SPRING_DAMPEN = 0.990;
static float SPRING_CONSTANT = 0.015;
static float GRAVITY = .35;


public int displayMode = 0;
public ArrayList<SoftBody> bodies = new ArrayList<SoftBody>();
void setup(){
  size(600, 600, P3D);
  frameRate(30);
  bodies.add(new SoftBody(300, 300, 0, 50, 0,0,0));
  
}

void draw(){
  background(200);
  for (int i = 0; i < bodies.size(); i++){
    bodies.get(i).display();
  }
  
}

void mouseClicked(){
}
