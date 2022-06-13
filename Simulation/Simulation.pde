import controlP5.*;
static float VertexRadius = 5;
static float SPRING_DAMPEN = .08;
static float SPRING_CONSTANT = 0.06;
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
float screen;
Info info = new Info();
int time = 0;
ControlP5 cp5;
Button reset;
Slider grav;
Slider dampen;
Slider springConstant;

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
    background(1, 50, 32);
    textSize(50);
    fill(255);
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
    if (time == 0) {
      buttonSetup();
      GRAVITY = grav.getValue();
      SPRING_DAMPEN = dampen.getValue();
      SPRING_CONSTANT = springConstant.getValue();
    }
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
    if (!(isMouseOverSliders()) && mouseDown && time>60) {
      body.move(xAvg+.1*(mouseX-xAvg), yAvg+.1*(mouseY-yAvg));
    }
    body.react();
    body.display();
    time++;
  }
  if (screen == 2) {
    info.display();
  }
}

void mousePressed() {
  if (time > 0 && reset.isPressed()) { 
    body = new SoftBody(400, 200, 200, 50, 5, 5, 0);
    xAvg = 400;
    yAvg = 200;
    zAvg = 0;
  } else if (screen == 0||screen == 2) {
    screen = 1;
  } else {
    mouseDown = true;
  }
}

boolean isMouseOverSliders() {
  return (reset.isMouseOver() || grav.isMouseOver() || dampen.isMouseOver() || springConstant.isMouseOver());
}

void buttonSetup() {
  reset = new Button(cp5, "Reset");
  reset.setSize(75, 25);
  reset.setPosition(30, 30);
  grav = new Slider(cp5, "GRAVITY");
  grav.setDefaultValue(0.4);
  grav.setPosition(30, 60);
  grav.setRange(0, 10);
  grav.setSize(30, 100);
  grav.setColorLabel(0);
  grav.setColorValue(0);
  dampen = new Slider(cp5, "DAMPENING");
  dampen.setScrollSensitivity(0.001);
  dampen.setDefaultValue(0.08);
  dampen.setPosition(85, 60);
  dampen.setRange(0.01, 0.1);
  dampen.setSize(30, 100);
  dampen.setColorLabel(0);
  dampen.setColorValue(0);
  springConstant = new Slider(cp5, "SPRING_CONSTANT");
  springConstant.setPosition(140, 60);
  springConstant.setRange(0.01, 3);
  springConstant.setDefaultValue(0.06);
  springConstant.setSize(30, 100);
  springConstant.setColorLabel(0);
  springConstant.setColorValue(0);
}

void mouseReleased() {
  mouseDown = false;
}

void keyPressed() {
  if (key == ' ') {
    mode = (mode + 1)%2;
  }
  if (key == 'i') {
    screen = 2;
  }
}
