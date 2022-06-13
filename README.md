# SoftBodySimulation

## Installation & System Requirements
Required Library: controlP5 for GUI widget interaction

## Description
### Brief Synopsis
We aim to create a soft-body simulation that will be user-interactive. Currently, we plan to render the visual elements of our project within Processing, with a minimum viable product resembling a functional simulation of a soft 3D ball under the effect of gravity and other obstacles. Afterwards, the product will be expanded to encompass more interactive components such as simulation reactions to user mouse inputs, impact with other obstacles, as well as other combinations of collisions.   

## Prototype Doc:  
https://tinyurl.com/softBodySimulation  

## UML Diagrams
### Prototype UML Diagram  
![Prototype UML Design](img/uml_prototype.png)
### Final UML Diagram
![Prototype UML Design](img/uml_prototype.png)

## Commit Log
05/20 - Jacob: I made constructors and instance variables for the main classes, including the for loop to create the vertices in the ball.  
05/21 - Jacob: I added edges to the ball, connecting the vertices in the ball constructor.  
05/23 - Kitty: I added gravity components; attempted adding documentation but changes were overwritten.  
05/23 - Jacob: I added the physics to make the springs connecting the vertices pull and push, as intended.  
05/24 - Kitty: I attempted to implement wall interactions with the soft body that would prevent the soft body from exiting the screen; bugs still present with sliding somewhat past boundaries.  
05/24 - Jacob: I attempted to fix some of the bugs resulting from the wall-interaction. I made some progress, but there is still some unwanted behavior when the ball hits a wall.  
05/25 - Jacob: fixed the explosions that occurred from wall interaction thought changing constants and dampening impact with wall.  
05/26 - Jacob: I changed the edge display method to improve perspective, by making edges darker as they go deeper into the screen.  
05/26 - Kitty: I worked on optimizing wall interaction methods, and resolved some bugs (one persisting bug with sticky top wall remaining).   
05/27 - Jacob: I added lines to create a frame of reference, in order to better view the 3-d nature of the object. I also reduced the connections, making the running more efficient.  
05/28 - Jacob: I further improved the edge displays to make the shading with respect to the average z-coordinate of the ball, rather than the z-coordinate in general. I started the coding for diagonal walls.  
05/29 - Jacob: I got working diagonal walls, with decent bouncing behavior.  
05/30 - Jacob: I refined the look of the ball by adding more points in the ball. i also tried, unsuccessfully, to create another diagonal wall in a different location with different orientation.  
05/30 - Kitty: I focused on resolving straying vertices and stabilizing the soft body as it reacts to the diagonal walls (WIP)
05/31 - Jacob: I added a second wall with different orientation.  
06/01 - Jacob: Attempted to eliminate ball from simultaneously being on both sides of a wall (WIP).  
06/01 - Kitty: I continued to work on fixing diagonal wall detection based on x, y, z positioning of adjacent boundary vertices.  
06/02 - Jacob: Failed attempt to eliminate issues and debug previous days work.  
06/02 - Kitty: Fine-tuned constants for a smoother behavior in the soft body.  
06/03 - Jacob: Attempts to eliminate bugs from edge-wall interactions did not work.    
06/03 - Kitty: I began to research alternative methods of maintaining the initial lattice structure and preventing rogue vertices; from there, I attempted to implement a mesh network between the vertices and edge length checking from a center of gravity.  
06/04 - Jacob: Rechecking all of the physics to make sure the problems are not the result of mistakes in spring physics. I did not find any issues.  
06/05 - Kitty: I attempted to implement basic length checking in edges, spikey behavior still persisting in the soft body.  
06/06 - Jacob: Reset back to demo stage and added mouse interactions to pull the ball.  
06/07 - Jacob: Colored edges based on x, y, and z position relative to the center of the ball. Added a front page and an info page. Added containment to prevent vertices from being too far from the center of the ball.  
06/07 - Kitty: I added some mouse interaction with the soft body (drag and drop) -- result was very buggy.  
06/08 - Jacob: fixed a bug with mouse interacting with the ball after first click.  
06/08 - Kitty: Attached slider output to values of constants.  
06/09 - Kitty: I worked on adding sliders to the GUI for resolving spikey behavior in the soft body.  
06/10 - Jacob: Added a reset button for the simulation.  
06/10 - Kitty: I attempted to resolve slider click and mouse drag conflict.  
06/12 - Jacob: Checking functionality.  
06/12 - Kitty: I finalized the GUI platform and addressed final issues in soft body behavior.
