/*
Adrian Copta | FAF-223
Exercise 1.8
*/

int numCircles = 15; // Number of circles in the array
Circle[] circles = new Circle[numCircles];

void setup() {
  size(400, 400); // Set canvas size to 400x400
  for (int i = 0; i < numCircles; i++) {
    float x = random(width);
    float y = random(height);
    circles[i] = new Circle(x, y);
  }
}

void draw() {
  background(0); // Bbackground color to a black

  for (int i = 0; i < numCircles; i++) {
    circles[i].followMouse();
    circles[i].update();
    circles[i].display();
  }
}

class Circle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 4;

  Circle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void followMouse() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    
    // Update the position without wrapping
    location.add(velocity);
  }

  void display() {
    fill(255, 0, 0); // Circle color to red (RGB 255, 0, 0)
    ellipse(location.x, location.y, 20, 20);
  }
}
