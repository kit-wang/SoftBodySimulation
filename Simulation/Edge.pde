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
    stroke((255.0/150.0)*(firstV.getZ()+secondV.getZ() + 150)*.5);
    //line from one endpoint to the other
    line(firstV.getX(), firstV.getY(), firstV.getZ(), secondV.getX(), secondV.getY(), secondV.getZ());
  }

  public float getLength() {
    return length;
  }

  public void pull() {
    //calculate force of the spring using equation F = kl
    float force = SPRING_CONSTANT*(firstV.distance(secondV) - length);

    //calculate differences in axial directions between the endpoints
    float displacex = (firstV.getX() - secondV.getX()) ;
    float displacey = (firstV.getY() - secondV.getY()) ;
    float displacez = (firstV.getZ() - secondV.getZ()) ;

    //change velocities for each based on the force applied by the spring in each direction
    //velocity for each direction gets changed by the force scaled by the proportion of the directional displacement out of the total distance
    firstV.setDX((firstV.getDX()-SPRING_DAMPEN*displacex*force/firstV.distance(secondV)));
    firstV.setDY((firstV.getDY()-SPRING_DAMPEN*displacey*force/firstV.distance(secondV)));
    firstV.setDZ((firstV.getDZ()-SPRING_DAMPEN*displacez*force/firstV.distance(secondV)));

    secondV.setDX((secondV.getDX()+SPRING_DAMPEN*displacex*force/firstV.distance(secondV)));
    secondV.setDY((secondV.getDY()+SPRING_DAMPEN*displacey*force/firstV.distance(secondV)));
    secondV.setDZ((secondV.getDZ()+SPRING_DAMPEN*displacez*force/firstV.distance(secondV)));
  }
}
