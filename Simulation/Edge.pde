public class Edge{
  private Vertex firstV;
  private Vertex secondV;
  
  private float length;
  
  public Edge(Vertex v1, Vertex v2, float len){
    firstV = v1; 
    secondV = v2;
    
    length = len;
  }
  
  public void display(){
    line(firstV.getX(), firstV.getY(), firstV.getZ(), secondV.getX(), secondV.getY(), secondV.getZ());
  }
}
