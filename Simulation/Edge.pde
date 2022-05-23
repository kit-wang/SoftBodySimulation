public class Edge {
  private Vertex firstV;
  private Vertex secondV;

  private float length;

  public Edge(Vertex v1, Vertex v2, float len) {
    firstV = v1; 
    secondV = v2;

    length = len;
  }

  public void display() {
    line(firstV.getX(), firstV.getY(), firstV.getZ(), secondV.getX(), secondV.getY(), secondV.getZ());
  }

  public float getLength() {
    return length;
  }

  public void pull() {
    float force = SPRING_CONSTANT*(firstV.distance(secondV) - length);
    float displacex = (firstV.getX() - secondV.getX()) ;
    float displacey = (firstV.getY() - secondV.getY()) ;
    float displacez = (firstV.getZ() - secondV.getZ()) ;
    firstV.setDX(SPRING_CONSTANT*(firstV.getDX()+displacex*force/firstV.distance(secondV)));
    firstV.setDY(SPRING_CONSTANT*(firstV.getDY()+displacey*force/firstV.distance(secondV)));
    firstV.setDZ(SPRING_CONSTANT*(firstV.getDZ()+displacez*force/firstV.distance(secondV)));
  }
}
