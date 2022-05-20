public class SoftBody {
  private ArrayList<Vertex> vertices;
  private ArrayList<Edge> edges;

  public SoftBody(float x, float y, float z, float radius, float xVel, float yVel, float zVel) {
    for (float i = x - radius; i < x + radius; i++) {
      for (float j = y-radius; j < y+radius; j++) {
        for (float k = z-radius; k < z+radius; k++) {
          if ((i-x)*(i-x) + (j-y)*(j-y) + (k-z)*(k-z) <= radius) {
            vertices.add(new Vertex(i, j, k, xVel, yVel, zVel, .01, false));
          }
        }
      }
    }
  }
}
