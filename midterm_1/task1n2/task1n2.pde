/*
Adrian Copta | FAF-223
Varianta 1
Point 1 + 2
*/

float x, y; // Coordinates of the fish
PImage water; // Background image of water

void setup() {
  size(400, 400);
  x = width / 2;
  y = height / 2; // Start the fish at the middle of the window
  
  // Load the background image
  water = loadImage("water.jpg");
  water.resize(width, height);
}

void draw() {
  background(water);
  
  // Draw the fish
  drawAnim(x, y);
  
  // Move the anim upwards
  y -= 1;
  
  // Reset the fish's position to the bottom if it goes off the top of the window
  if (y < -20) {
    y = height;
  }
}

void drawAnim(float x, float y) {
  // Createing the fish using 2D primitives
      fill(random(255), random(255), random(255));
    triangle(x, y, x + 20, y, x + 10, y - 30);
    rect(x + 5, y - 30, 10, 30, 10, 10, 0, 0);
    ellipse(x + 10, y - 45, 10, 15);
    ellipse(x + 10, y - 25, 15, 35);
}
