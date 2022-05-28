public class SoftBody {
  private ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  private ArrayList<Edge> edges = new ArrayList<Edge>();
  private ArrayList<Vertex> boundary = new ArrayList<Vertex>();
  private ArrayList<Edge> boundaryE = new ArrayList<Edge>();
  public float zAvg;
  private float zCounter;

  public SoftBody(float x, float y, float z, float radius, float xVel, float yVel, float zVel) {
    float distSq;
    //loop over every position in the box centered at the body's center with side length 2*radius
    for (float i = x - radius; i < x + radius+1; i+=25) {
      for (float j = y-radius; j < y+radius+1; j+=25) {
        for (float k = z-radius; k < z+radius+1; k+=25) {
          //find the square of the distance from the position to the center
          distSq = (i-x)*(i-x) + (j-y)*(j-y) + (k-z)*(k-z);
          //see if distance is within the ball, but not near the boundary, and add to the ArrayList of vertices
          if (sqrt(distSq) <= radius -25*sqrt(3)+1) {
            vertices.add(new Vertex(i, j, k, xVel, yVel, zVel));
            //otherwise if point is within the ball, but on the boundary, we add to the ArrayList
          } else if (sqrt(distSq) <= radius+1) {

            vertices.add(new Vertex(i, j, k, xVel, yVel, zVel));
            boundary.add(vertices.get(vertices.size() - 1));
          }
        }
      }
    }

    Edge e;
    for (int i = 0; i < vertices.size(); i++) {
      for (int j = i+1; j < vertices.size(); j++) {
        e = new Edge(vertices.get(i), vertices.get(j), vertices.get(i).distance(vertices.get(j)), this);
        if (e.getLength() <= 25*sqrt(3)) {
          edges.add(e);
        }
        if (boundary.contains(vertices.get(i)) && boundary.contains(vertices.get(j))) {
          boundaryE.add(e);
        }
      }
    }
  }

  public void display() {
    if (mode == VERTEX_MODE) {
      for (int i = 0; i < boundary.size(); i++) {
        boundary.get(i).display();
      }
    }
    if (mode == EDGE_MODE) {
      for (int j = 0; j < boundaryE.size(); j++) {
        boundaryE.get(j).display();
      }
    }
  }

  public void react() {
    for (int i = 0; i < edges.size(); i++) {
      edges.get(i).pull();
    }
    zCounter = 0;
    for (int i = 0; i < vertices.size(); i++) {
      vertices.get(i).move();
      zCounter+=vertices.get(i).getZ();
    }
    zAvg = zCounter/vertices.size();
  }
}
