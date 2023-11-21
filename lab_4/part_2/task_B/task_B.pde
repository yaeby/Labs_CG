/*
Adrian Copta | FAF-223
*/

PImage water; // Background image of water

Animal[] animals; // Array of animal objects
int numAnimals = 15; // Number of fish

void setup() {
  size(400, 400);
  animals = new Animal[numAnimals];
  
  for (int i = 0; i < numAnimals; i++) {
    // Initialize fish at random positions
    animals[i] = new Animal(random(width), random(height));
  }


// Load the background image
  water = loadImage("water.jpg"); 
  water.resize(width, height);
  
}

void draw() {
  background(water);
  
  // Array of fish objects using Perlin noise
  for (int i = 0; i < numAnimals; i++) {
    animals[i].move();
    animals[i].display();
  }
}

class Animal {
  float x, y;
  
  Animal(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void move() {
    // Move the fish object upwards
    y -= 1;
    
    // Checking if it has reached the top, then reset its position to the bottom
    if (y < 0) {
      y = height;
    }
    
    // Applying Perlin noise to the x-coordinate for random horizontal movement
    x += noise(y * 0.01) * 2 - 1;
  }
  
  void display() {
    // Createing the fish using 2D primitives
      fill(random(255), random(255), random(255));
    triangle(x, y, x + 20, y, x + 10, y - 30);
    rect(x + 5, y - 30, 10, 30, 10, 10, 0, 0);
    ellipse(x + 10, y - 45, 10, 15);
    ellipse(x + 10, y - 25, 15, 35);
  }
}
