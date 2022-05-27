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
    circle(xPosition, yPosition, VertexRadius*2);
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
    boolean check = (xPosition < VertexRadius || xPosition > width);
    return check;
  }

  public boolean detectHorizontalWall() {
    boolean check = (yPosition < VertexRadius || yPosition > height);
    return check;
  }

  public void move() {

    if (Gravity) {
      setDY(getDY()+GRAVITY);
    }
    //if (detectVerticalWall()) {
    //  if (xPosition > VertexRadius) {
    //    xPosition = width-VertexRadius;
    //  } else {
    //    xPosition = VertexRadius;
    //  }
    //  setDX(-.6 * getDX());
    //}
    //if (detectHorizontalWall()) {

    //  if (yPosition > VertexRadius) {
    //    yPosition = height-VertexRadius;
    //  } else {
    //    yPosition = VertexRadius;
    //  }
    //  setDY(-.6 * getDY());
    //}
    if (xPosition < VertexRadius) {
      xVelocity*=-.9;
      xPosition = VertexRadius;
    } else if (xPosition > width - VertexRadius) {
      xVelocity*=-.9;
      xPosition = abs(VertexRadius-width);
    } 
    if (yPosition < VertexRadius) {
      yVelocity*=-.9;
      yPosition = VertexRadius;
    } else if (yPosition > height - VertexRadius) {
      yVelocity*=-.9;
      yPosition = abs(VertexRadius-height);
    }
    if (zPosition < VertexRadius - 600) {
      zVelocity*=-.9;
      zPosition = VertexRadius -600;
    } else if (xPosition > 600 - VertexRadius) {
      xVelocity*=-.9;
      xPosition = abs(VertexRadius-600);
    }
    xPosition+=xVelocity;
    yPosition+=yVelocity;
    zPosition+=zVelocity;
  }
}
