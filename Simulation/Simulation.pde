static float VertexRadius = 5;
static float SPRING_DAMPEN = .01;
static float SPRING_CONSTANT = 0.1;
static float GRAVITY = .4;
static final int EDGE_MODE = 1;
static final int VERTEX_MODE = 0;
static int mode = EDGE_MODE;
public SoftBody body;
public boolean Gravity = true;
public color VColor = color(0);
Boolean stop = false;
public float xAvg, yAvg, zAvg;
public boolean mouseDown = false;
float k;


void setup() {
  size(800, 800, P3D);
  frameRate(30);
  body = new SoftBody(600, 200, 0, 50, 5, 5, 0);
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
    k = (i+200.0)/400;
    println(k);
    stroke(252*k, 3*k, 152*k);
    line(400, 500, i, 700, 200, i);
  }
  if (mouseDown){
    body.move(xAvg+.1*(mouseX-xAvg), yAvg+.1*(mouseY-yAvg));
  }
  body.react();
  body.display();
}

void mousePressed() {
  mouseDown = true;
}

void mouseReleased(){
  mouseDown = false;
}
