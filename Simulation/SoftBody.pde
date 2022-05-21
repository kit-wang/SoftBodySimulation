public class SoftBody {
  private ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  private ArrayList<Edge> edges = new ArrayList<Edge>();
  private ArrayList<Vertex> boundary = new ArrayList<Vertex>();

  public SoftBody(float x, float y, float z, float radius, float xVel, float yVel, float zVel) {
    float distSq;
    for (float i = x - radius; i < x + radius; i+=10) {
      for (float j = y-radius; j < y+radius; j+=10) {
        for (float k = z-radius; k < z+radius; k+=10) {
          distSq = (i-x)*(i-x) + (j-y)*(j-y) + (k-z)*(k-z);
          if (sqrt(distSq) <= radius - sqrt(3)*radius) {
            vertices.add(new Vertex(i, j, k, xVel, yVel, zVel));
          } else if (sqrt(distSq) <= radius) {
            vertices.add(new Vertex(i, j, k, xVel, yVel, zVel));
            boundary.add(vertices.get(vertices.size() - 1));
          }
        }
      }
    }
    for (int i = 0; i < vertices.size(); i++){
      for (int j = i+1; j < vertices.size(); j++){
        edges.add(new Edge(vertices.get(i), vertices.get(j), vertices.get(i).distance(vertices.get(j))));
  }
  
  public void display(){
    for (int i = 0; i < boundary.size(); i++){
      boundary.get(i).display();
    }
  }
}
