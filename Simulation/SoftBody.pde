public class SoftBody {
  private ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  private ArrayList<Edge> edges = new ArrayList<Edge>();
  private ArrayList<Vertex> boundary = new ArrayList<Vertex>();
  private ArrayList<Edge> boundaryE = new ArrayList<Edge>();
  private float xCounter, yCounter, zCounter;
  private float radius;

  public SoftBody(float x, float y, float z, float radius, float xVel, float yVel, float zVel) {
    float distSq;
    this.radius = radius;
    //loop over every position in the box centered at the body's center with side length 2*radius
    for (float i = x - radius; i < x + radius+1; i+=15) {
      for (float j = y-radius; j < y+radius+1; j+=15) {
        for (float k = z-radius; k < z+radius+1; k+=15) {
          //find the square of the distance from the position to the center
          distSq = (i-x)*(i-x) + (j-y)*(j-y) + (k-z)*(k-z);
          //see if distance is within the ball, but not near the boundary, and add to the ArrayList of vertices
          if (sqrt(distSq) <= radius -15*sqrt(3)+1) {
            //vertices.add(new Vertex(i, j, k, xVel, yVel, zVel));
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
        e = new Edge(vertices.get(i), vertices.get(j), vertices.get(i).distance(vertices.get(j))-1);
        if (e.getLength() <= 30*sqrt(3)) {
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
    xCounter = 0;
    yCounter = 0;
    zCounter = 0;
    for (int i = 0; i < vertices.size(); i++) {
      vertices.get(i).move();
      vertices.get(i).contain(radius+10);
      xCounter+=vertices.get(i).getX();
      yCounter+=vertices.get(i).getY();
      zCounter+=vertices.get(i).getZ();
    }
    xAvg = xCounter/vertices.size();
    yAvg = yCounter/vertices.size();
    zAvg = zCounter/vertices.size();
  }

  public void move(float x, float y) {
    for (int i = 0; i < vertices.size(); i++) {
      vertices.get(i).setX(vertices.get(i).getX()+x-xAvg);
      vertices.get(i).setY(vertices.get(i).getY()+y-yAvg);
    }
  }
}
