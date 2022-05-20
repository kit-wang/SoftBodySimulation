public class SoftBody {
  private ArrayList<Vertex> vertices;
  private ArrayList<Edge> edges;

  public SoftBody(float x, float y, float z, float radius, float xVel, float yVel, float zVel) {
    float dist;
    for (float i = x - radius; i < x + radius; i+= 10) {
      for (float j = y-radius; j < y+radius; j+=10) {
        for (float k = z-radius; k < z+radius; k+=10) {
          dist = (i-x)*(i-x) + (j-y)*(j-y) + (k-z)*(k-z);
          if (dist <= radius - 2*VertexRadius) {
            vertices.add(new Vertex(i, j, k, xVel, yVel, zVel, false));
          } else if (dist <= radius) {
            vertices.add(new Vertex(i, j, k, xVel, yVel, zVel, true));
          }
        }
      }
    }
  }
}
