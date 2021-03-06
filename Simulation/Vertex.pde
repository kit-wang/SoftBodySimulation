public class Vertex {
  private float xPosition;
  private float yPosition;
  private float zPosition;
  private float xVelocity;
  private float yVelocity;
  private float zVelocity;

  public Vertex(float x, float y, float z, float xVel, float yVel, float zVel) {
    xPosition = x;
    yPosition = y;
    zPosition = z;

    xVelocity = xVel;
    yVelocity = yVel;
    zVelocity = zVel;
  }

  public void display() {
    noStroke();
    float xCol = (255.0/100.0)*(xPosition - xAvg+50);
    float yCol = (255.0/100.0)*(yPosition - yAvg+50);
    float zCol = (255.0/100.0)*(zPosition - zAvg+50);
    fill(xCol, yCol, zCol);
    translate(0, 0, zPosition);
    circle(xPosition, yPosition, VertexRadius*2);
    translate(0, 0, -zPosition);
  }

  /* Accessor methods for Vertex position components */
  public float getX() {
    return xPosition;
  }
  public float getY() {
    return yPosition;
  }
  public float getZ() {
    return zPosition;
  }

  /*  Mutator methods for Vertex position components */
  public void setX(float x) {
    xPosition = x;
  }
  public void setY(float y) {
    yPosition = y;
  }
  public void setZ(float z) {
    zPosition = z;
  }

  /* Accessor methods for Vertex velocity components */
  public float getDX() {
    return xVelocity;
  }
  public float getDY() {
    return yVelocity;
  }
  public float getDZ() {
    return zVelocity;
  }

  /*  Mutator methods for Vertex velocity components */
  public void setDX(float dx) {
    xVelocity = dx;
  }
  public void setDY(float dy) {
    yVelocity = dy;
  }
  public void setDZ(float dz) {
    zVelocity = dz;
  }

  /* Calculates distance between two Vertex objects*/
  public float distance(Vertex other) {
    return dist(xPosition, yPosition, zPosition, other.getX(), other.getY(), other.getZ());
  }

  public void reactXWall() {
    if (xPosition < VertexRadius+100) {
      xVelocity*=-.95;
      xPosition = VertexRadius+100;
    } else if (xPosition > 700 - VertexRadius) {
      xVelocity*=-.95;
      xPosition = abs(VertexRadius-700);
    }
  }

  public void reactYWall() {
    if (yPosition < 100+VertexRadius) {
      yVelocity*=-.95;
      yPosition = VertexRadius+100;
    } else if (yPosition > 700 - VertexRadius) {
      yVelocity*=-.95;
      yPosition = abs(VertexRadius-700);
    }
  }

  public void reactZWall() {
    if (zPosition < VertexRadius - 150) {
      zVelocity*=-.95;
      zPosition = VertexRadius -150;
    } else if (zPosition > 150 - VertexRadius) {
      zVelocity*=-.95;
      zPosition = abs(VertexRadius-150);
    }
  }

  public void reactDiag1() {
    float dist = (xPosition + yPosition - 900)/sqrt(2);
    float prevDist = (xPosition - xVelocity + yPosition - yVelocity - 900)/sqrt(2);
    if (xPosition > 400 && dist*prevDist < 0) {
      //if (xVelocity < yVelocity){
      //  xPosition += dist/sqrt(2) - 2*VertexRadius/sqrt(2);
      //  yPosition += dist/sqrt(2) - 2*VertexRadius/sqrt(2);
      //}else{
      //  xPosition -= dist/sqrt(2) - 2*VertexRadius/sqrt(2);
      //  yPosition -= dist/sqrt(2) - 2*VertexRadius/sqrt(2);
      //}
      xPosition-= xVelocity;
      yPosition-=yVelocity;
      float hold = yVelocity;
      yVelocity = -xVelocity;
      xVelocity = -hold;
    }
  }

  //public void reactDiag2() {
  //  float dist = (-xPosition + yPosition - 200)/sqrt(2);
  //  float prevDist = (- xPosition + xVelocity + yPosition - yVelocity - 200)/sqrt(2);
  //  if (xPosition < 300 && dist*prevDist < 0){
  //    //if (xVelocity < yVelocity){
  //    //  xPosition += dist/sqrt(2) - 2*VertexRadius/sqrt(2);
  //    //  yPosition += dist/sqrt(2) - 2*VertexRadius/sqrt(2);
  //    //}else{
  //    //  xPosition -= dist/sqrt(2) - 2*VertexRadius/sqrt(2);
  //    //  yPosition -= dist/sqrt(2) - 2*VertexRadius/sqrt(2);
  //    //}
  //    xPosition-= xVelocity;
  //    yPosition-=yVelocity;
  //    float hold = yVelocity;
  //    yVelocity = xVelocity;
  //    xVelocity = hold;
  //  }
  //}

  public void contain(float r) {
    float dist = dist(xAvg, yAvg, zAvg, xPosition, yPosition, zPosition);
    if (dist > r+1) {
      xPosition=xAvg+(r/dist)*(xPosition - xAvg);
      yPosition=yAvg+(r/dist)*(yPosition - yAvg);
      zPosition=zAvg+(r/dist)*(zPosition - zAvg);
      
      // TODO: adjust velocities 
    }
  }

  public void move() {


    if (Gravity) {
      yVelocity+=GRAVITY;
    }

    reactXWall();
    reactYWall();
    reactZWall();
    xPosition+=xVelocity;
    yPosition+=yVelocity;
    zPosition+=zVelocity;
    reactDiag1();
    reactXWall();
    reactYWall();
    reactZWall();
  }
}
