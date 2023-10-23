/*
Adrian Copta | FAF-223
Varianta 1
Exercise 1.1
*/

int numRaindrops = 100;  // Number of raindrops
PVector[] positions;     // Positions of the raindrops
PVector[] velocities;    // Velocities of the raindrops
float gravity = 0.2;     // Gravity acting on the raindrops

void setup() {
  size(400, 400);
  
  // Initialize arrays for positions and velocities
  positions = new PVector[numRaindrops];
  velocities = new PVector[numRaindrops];
  
  // Initialize raindrops
  for (int i = 0; i < numRaindrops; i++) {
    positions[i] = new PVector(random(width), random(height));  // Starting position at random (x, y)
    velocities[i] = new PVector(0, random(1, 5));  // Initial random velocity
  }
}

void draw() {
  background(220);

  // Update and draw each raindrop
  for (int i = 0; i < numRaindrops; i++) {
    velocities[i].y += gravity;  // Apply gravity
    positions[i].add(velocities[i]);

    // Check if the raindrop is out of the canvas, reset it to the top
    if (positions[i].y > height) {
      positions[i].y = 0;
      positions[i].x = random(width);
      velocities[i] = new PVector(0, random(1, 5));
    }

    // Draw the raindrop
    stroke(0, 0, 255);  // Blue raindrop
    line(positions[i].x, positions[i].y, positions[i].x, positions[i].y + 10);  // Line representing the raindrop
  }
}
