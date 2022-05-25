public class Vertex {
  private float xPosition;
  private float yPosition;
  private float zPosition;

  private float xVelocity;
  private float yVelocity;
  private float zVelocity;

  public Vertex(float x, float y, float z, float xVel, float yVel, float zVel) {
    xPosition = x;
    yPosition = y;
    zPosition = z;

    xVelocity = xVel;
    yVelocity = yVel;
    zVelocity = zVel;
  }

  public void display() {
    noStroke();
    fill(VColor);
    translate(0, 0, zPosition);
    circle(xPosition, yPosition, 3*VertexRadius);
    translate(0, 0, -zPosition);
  }

  public float getX() {
    return xPosition;
  }
  public float getY() {
    return yPosition;
  }
  public float getZ() {
    return zPosition;
  }

  public void setX(float x) {
    xPosition = x;
  }
  public void setY(float y) {
    yPosition = y;
  }
  public void setZ(float z) {
    zPosition = z;
  }

  public float getDX() {
    return xVelocity;
  }
  public float getDY() {
    return yVelocity;
  }
  public float getDZ() {
    return zVelocity;
  }

  public void setDX(float dx) {
    xVelocity = dx;
  }
  public void setDY(float dy) {
    yVelocity = dy;
  }
  public void setDZ(float dz) {
    zVelocity = dz;
  }

  public float distance(Vertex other) {
    return dist(xPosition, yPosition, zPosition, other.getX(), other.getY(), other.getZ());
  }

  public boolean detectVerticalWall() {
    boolean check = (xPosition < 0 || xPosition > width);
    return check;
  }

  public boolean detectHorizontalWall() {
    boolean check = (yPosition < 0 || yPosition > height);
    return check;
  }

  public void move() {
    xPosition+=xVelocity;
    yPosition+=yVelocity;
    zPosition+=zVelocity;
    if (Gravity) {
      yVelocity+=GRAVITY;
    }
    if (detectVerticalWall()) {
      setDX(-.8 * getDX());
    }
    if (detectHorizontalWall()) {
      setDY(-.8 * getDY());
    }
  }
}
