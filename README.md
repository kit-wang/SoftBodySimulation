# SoftBodySimulation

## Installation & System Requirements

## Description
### Brief Synopsis
We aim to create a soft-body simulation that will be user-interactive. Currently, we plan to render the visual elements of our project within Processing, with a minimum viable product resembling a functional simulation of a soft 3D ball under the effect of gravity and other obstacles. Afterwards, the product will be expanded to encompass more interactive components such as simulation reactions to user mouse inputs, impact with other obstacles, as well as other combinations of collisions.   

## Prototype Doc:  
https://docs.google.com/document/d/1UYKS9-Bp7HBw1WUIw0KsM1lXloKazP6HbpHPUF0QfC0/edit?usp=sharing  

## UML Diagrams
### Prototype UML Diagram  
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
