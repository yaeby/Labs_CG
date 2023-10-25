/*
Adrian Copta | FAF-223
Exercise 1.2
*/

void setup() {
  size(400, 400);
  walker = new Walker();
}

void draw() {
  background(220); // Background color to light gray
  walker.step();
  walker.display();
}

class Walker {
  PVector position;
  PVector velocity;

  Walker() {
    position = new PVector(width / 2, height / 2);
    velocity = PVector.random2D().mult(2); // Set initial random velocity with a maximum magnitude of 2
  }

  void step() {
    PVector acceleration = PVector.random2D();
    velocity.add(acceleration);
    velocity.limit(2); // Limit the speed
    position.add(velocity);

    // Wrap around the screen
    if (position.x < 0) position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y < 0) position.y = height;
    if (position.y > height) position.y = 0;
  }

  void display() {
    fill(0); // Set ball color to black
    ellipse(position.x, position.y, 20, 20); // Increase the ball size to 20x20
  }
}

Walker walker;
