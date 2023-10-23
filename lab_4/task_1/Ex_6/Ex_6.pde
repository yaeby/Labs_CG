/*
Adrian Copta | FAF-223
Varianta 1
Exercise 1.6
*/

float tx = 0, ty = 10000; // Initialize noise variables for x and y
float accelerationX = 0.01; // Initialize initial acceleration values for x and y
float accelerationY = 0.01;

void setup() {
  size(400, 400); // Set canvas size
}

void draw() {
  background(0); // Background color to black 
  
  // Calculate x and y positions based on Perlin noise
  float x = map(noise(tx), 0, 1, 0, width);
  float y = map(noise(ty), 0, 1, 0, height);
  
  // Draw an ellipse at the calculated position
  fill(255, 0, 0); // Ellipse color to red 
  ellipse(x, y, 16, 16);
 
  tx += accelerationX;
  ty += accelerationY;
  
  // Increase acceleration over time
  accelerationX += 0.0001;
  accelerationY += 0.0001;
}
