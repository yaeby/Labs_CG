/*
Adrian Copta | FAF-223
*/

float posX, posY;  // Position
float velX, velY;  // Velocity
float accX, accY;  // Acceleration

void setup() {
  size(800, 600);
  posX = width / 2;
  posY = height / 2;
}

void draw() {
  background(220);

  // Apply random acceleration
  accX = random(-1, 1);
  accY = random(-1, 1);

  // Update velocity based on acceleration
  velX += accX;
  velY += accY;

  // Limit the bunny's speed
  float maxSpeed = 5;
  float speed = dist(0, 0, velX, velY);
  if (speed > maxSpeed) {
    velX = (velX / speed) * maxSpeed;
    velY = (velY / speed) * maxSpeed;
  }

  // Update position based on velocity
  posX += velX;
  posY += velY;

  // Draw the bunny
  ellipse(posX, posY, 20, 20);
}
