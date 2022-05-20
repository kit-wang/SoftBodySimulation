public class Vertex {
  private float xPosition;
  private float yPosition;
  private float zPosition;

  private float xVelocity;
  private float yVelocity;
  private float zVelocity;

  private float radius;

  private boolean isBoundary;

  public Vertex(float x, float y, float z, float xVel, float yVel, float zVel, float rad, boolean onBoundary) {
    xPosition = x;
    yPosition = y;
    zPosition = z;

    xVelocity = xVel;
    yVelocity = yVel;
    zVelocity = zVel;

    radius = rad;
    isBoundary = onBoundary;
  }
}
