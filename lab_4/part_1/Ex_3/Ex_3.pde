/*
Adrian Copta | FAF-223
Exercise 1.3
*/

PVector location;
PVector velocity;
float sphereSize = 40; // Increased sphere size
float boxSize = 200;   // Size of the bounding box
color sphereColor;     // Color of the sphere
color boxColor;        // Color of the bounding box

void setup() {
  size(640, 360, P3D);
  location = new PVector(random(-boxSize/2, boxSize/2), random(-boxSize/2, boxSize/2), random(-boxSize/2, boxSize/2));
  velocity = new PVector(random(1, 3), random(1, 3), random(1, 3));
  sphereColor = color(255, 0, 0); // Set sphere color to red
  boxColor = color(0, 0, 255, 50); // Set box color to semi-transparent blue
}

void draw() {
  background(240); // Background color to light gray

  location.add(velocity);

  // Check and correct the position if it goes outside the box
  if (location.x + sphereSize / 2 > boxSize / 2 || location.x - sphereSize / 2 < -boxSize / 2) {
    velocity.x = -velocity.x;
    location.x = constrain(location.x, -boxSize / 2 + sphereSize / 2, boxSize / 2 - sphereSize / 2);
  }
  if (location.y + sphereSize / 2 > boxSize / 2 || location.y - sphereSize / 2 < -boxSize / 2) {
    velocity.y = -velocity.y;
    location.y = constrain(location.y, -boxSize / 2 + sphereSize / 2, boxSize / 2 - sphereSize / 2);
  }
  if (location.z + sphereSize / 2 > boxSize / 2 || location.z - sphereSize / 2 < -boxSize / 2) {
    velocity.z = -velocity.z;
    location.z = constrain(location.z, -boxSize / 2 + sphereSize / 2, boxSize / 2 - sphereSize / 2);
  }

  stroke(0);
  fill(sphereColor); // Set sphere color to red
  pushMatrix();
  translate(width / 2, height / 2, 0);
  translate(location.x, location.y, location.z);
  sphere(sphereSize); // Draw a fully colored sphere
  popMatrix();

  // Draw the bounding box centered in the sketch
  noFill();
  stroke(0);
  translate(width / 2, height / 2, 0);
  box(boxSize);
}
