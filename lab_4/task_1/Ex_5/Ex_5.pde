/*
Adrian Copta | FAF-223
Varianta 1
Exercise 1.5
*/


PVector position;
PVector velocity;
PVector acceleration;
float carSize = 30;
float maxSpeed = 4;
float accelerationRate = 0.2;
float brakeRate = 0.4;
boolean accelerate = false;
boolean brake = false;

void setup() {
  size(400, 400);
  position = new PVector(width / 2, height, carSize * 2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
}

void draw() {
  background(220);

  // Check user input
  if (accelerate) {
    acceleration = new PVector(0, -accelerationRate); // Accelerate upwards
  } else if (brake) {
    acceleration = new PVector(0, brakeRate); // Brake downwards
  } else {
    acceleration.mult(0); // No input, no acceleration
  }

  // Update velocity and limit speed
  velocity.add(acceleration);
  velocity.limit(maxSpeed);

  // Update position
  position.add(velocity);

  // Check and correct position if it goes out of bounds
  if (position.y < -carSize) {
    position.y = height;
  }

  // Draw the car
  fill(255, 0, 0);
  rectMode(CENTER);
  pushMatrix();
  translate(position.x, position.y);
  rotate(PI); // Rotate the car 180 degrees to move from bottom to top
  rect(0, 0, carSize, carSize * 2);
  popMatrix();
  
 // Draw the car lights
  fill(255, 50, 0); 
  ellipse(position.x - carSize / 2, position.y + carSize, carSize / 4, carSize / 4);
  ellipse(position.x + carSize / 2, position.y + carSize, carSize / 4, carSize / 4);
  
  fill(255, 255, 0); 
  ellipse(position.x - carSize / 4, position.y - carSize, carSize / 8, carSize / 8);
  ellipse(position.x + carSize / 4, position.y - carSize, carSize / 8, carSize / 8);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      accelerate = true;
    } else if (keyCode == DOWN) {
      brake = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      accelerate = false;
    } else if (keyCode == DOWN) {
      brake = false;
    }
  }
}
