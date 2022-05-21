public class Vertex {
  private float xPosition;
  private float yPosition;
  private float zPosition;

  private float xVelocity;
  private float yVelocity;
  private float zVelocity;

  private boolean isBoundary;

  public Vertex(float x, float y, float z, float xVel, float yVel, float zVel, boolean onBoundary) {
    xPosition = x;
    yPosition = y;
    zPosition = z;

    xVelocity = xVel;
    yVelocity = yVel;
    zVelocity = zVel;

    isBoundary = onBoundary;
  }
  
  public void display(){
    if (isBoundary){
      translate(xPosition, yPosition, zPosition);
      sphere(VertexRadius);
      fill(0);
      translate(-xPosition, -yPosition, -zPosition);
    }
  }
}
