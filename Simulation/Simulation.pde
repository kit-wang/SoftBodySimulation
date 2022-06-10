import controlP5.*;
static final float VertexRadius = 5;
static final float SPRING_DAMPEN = .01;
static float SPRING_CONSTANT = 1;
static final float GRAVITY = .4;
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
float screen;
Info info = new Info();
int time = 0;
ControlP5 cp5;

void setup() {
  size(800, 800, P3D);
  cp5 = new ControlP5(this);
  frameRate(30);
  screen = 0;
  xAvg = 600;
  yAvg = 200;
  zAvg = 0;
  body = new SoftBody(600, 200, 200, 50, 5, 5, 0);
}

void draw() {
  if (screen == 0) {
    background(116, 232, 116);
    textSize(50);
    fill(202, 83, 245);
    textAlign(CENTER);
    text("SoftBody Simulation", 400, 200);
    textSize(35);
    text("JuKtaposition", 400, 270);
    textSize(20);
    text("Click anywhere to start simulation", 400, 350);
    text("Click 'i' for more information", 400, 400);
    text("Kitty Wang and Jacob Paltrowitz", 400, 600);
  }
  if (screen == 1) {
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
    for (int i = -150; i <= 150; i+=1) {
      k = (i+200.0)/400;
      stroke(252*k, 3*k, 152*k);
      line(400, 500, i, 700, 200, i);
    }
    if (mouseDown && time>30) {
      body.move(xAvg+.1*(mouseX-xAvg), yAvg+.1*(mouseY-yAvg));
    }
    body.react();
    body.display();
    time++;
  }
  if (screen == 2){
    info.display();
  }
}

void mousePressed() {
  if (screen == 0||screen == 2) {
    screen = 1;
  } else {
    mouseDown = true;
  }
}

void mouseReleased() {
  mouseDown = false;
}

void keyPressed() {
  if (key == ' ') {
    mode = (mode + 1)%2;
  }
  if (key == 'i'){
    screen = 2;
  }
}
