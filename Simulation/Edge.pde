public class Edge{
  private Vertex firstEndpoint;
  private Vertex secondEndpoint;
  
  private float length;
  
  public Edge(Vertex v1, Vertex v2, float len){
    firstEndpoint = v1; 
    secondEndpoint = v2;
    
    length = len;
  }
}
