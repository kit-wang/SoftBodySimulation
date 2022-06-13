public class Info {
  public void display() {
    background(11, 11, 69);
    fill(5, 2, 110);
    textSize(18);
    textAlign(CENTER);
    String info1 = "This project focuses on the simulation of a soft object as a network";
    String info2 = "of vertices connected by springs. You can use the space bar, ' ', to";
    String info3 = "toggle between Edge and Vertex form, changing the display accordingly";
    String info4 = "The colors signify the x, y, and z position, correlating to R, G, and B";
    String info5 = "values. Clicking the mouse pulls the object towards the mouse's position.";
    String info6 = "Hope you enjoy! Click anywhere to begin the simulation.";
    text(info1, 50, 100);
    text(info2, 50, 125);
    text(info3, 50, 150);
    text(info4, 50, 175);
    text(info5, 50, 200);
    text(info6, 50, 225);
  }
}
