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

  /* Accessor methods for Vertex position components */
  public float getX() {
    return xPosition;
  }
  public float getY() {
    return yPosition;
  }
  public float getZ() {
    return zPosition;
  }

  /*  Mutator methods for Vertex position components */
  public void setX(float x) {
    xPosition = x;
  }
  public void setY(float y) {
    yPosition = y;
  }
  public void setZ(float z) {
    zPosition = z;
  }

  /* Accessor methods for Vertex velocity components */
  public float getDX() {
    return xVelocity;
  }
  public float getDY() {
    return yVelocity;
  }
  public float getDZ() {
    return zVelocity;
  }

  /*  Mutator methods for Vertex velocity components */
  public void setDX(float dx) {
    xVelocity = dx;
  }
  public void setDY(float dy) {
    yVelocity = dy;
  }
  public void setDZ(float dz) {
    zVelocity = dz;
  }

  /* Calculates distance between two Vertex objects*/
  public float distance(Vertex other) {
    return dist(xPosition, yPosition, zPosition, other.getX(), other.getY(), other.getZ());
  }

  public void reactXWall() {
    if (xPosition < VertexRadius+100) {
      xVelocity*=-.9;
      xPosition = VertexRadius+100;

    }
    else if (xPosition > 700 - VertexRadius) {
      xVelocity*=-.9;
      xPosition = abs(VertexRadius-700);

    }
  }

  public void reactYWall() {
    if (yPosition < 100+VertexRadius) {
      yVelocity*=-.9;
      yPosition = VertexRadius+100;

    }
    else if (yPosition > 700 - VertexRadius) {
      yVelocity*=-.9;
      yPosition = abs(VertexRadius-700);

    }
  }

  public void reactZWall() {
    if (zPosition < VertexRadius - 300) {
      zVelocity*=-.9;
      zPosition = VertexRadius -300;

    }
    else if (zPosition > 300 - VertexRadius) {
      zVelocity*=-.9;
      zPosition = abs(VertexRadius-300);

    }
  }

  public void move() {

    if (Gravity) {
      yVelocity+=GRAVITY;
    }

    reactXWall();
    reactYWall();
    reactZWall();

    xPosition+=xVelocity;
    yPosition+=yVelocity;
    zPosition+=zVelocity;
  }
}
