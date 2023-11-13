/*
ADRIAN COPTA 
*/

PImage sky;
PVector wind;
PVector gravity;
float time;

class Balloon {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  char letter;
  
  Balloon(char letter, float m, float x, float y) {
    this.letter = letter;
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
void update() {
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
  
  float topBoundary = 30; // Change this value to set how close the balloon can get to the top
  if (location.y < topBoundary) {
    location.y = topBoundary;
    velocity.y *= -1;
  }
}
  
void display() {
  stroke(0);
  //fill(0, 0, 225);
  pushMatrix();
  translate(location.x, location.y);
  
  if (letter == 'A') {
    // Create the 'A' shape using boxes
    fill(0, 0, 225);
    box(10, 50, 10);
    translate(-20, 0, 0);
    box(10, 50, 10);
    translate(10, -30, 0);
    box(15, 10, 10);
    translate(0, 30, 0);
    box(30, 10, 10);
    
    line(-10, 100, -10, 10);
  } else if (letter == 'C') {
    // Create the 'C' shape using boxes
    fill(225, 0, 0);
    box(10, 40, 10);
    translate(15, 20, 0);
    box(25, 10, 10);
    translate(0, -40, 0);
    box(25, 10, 10);
    
    line(0, 115, 0, 40);
  }
  
  popMatrix();
}


  
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}

Balloon balloonA;
Balloon balloonC;

void setup() {
  size(800, 800, P3D);
  balloonA = new Balloon('A', 1, 200, height/2);
  balloonC = new Balloon('C', 1, 600, height/2);
  gravity = new PVector(0, -0.05);
  wind = new PVector();
  time = 0;
  
  // Load the background image
  sky = loadImage("sky.jpg"); 
  sky.resize(width, height);
}

void draw() {
  background(sky);
  
  time += 0.01;
  wind.x = map(noise(time), 0, 1, -0.2, 0.2);
  
  PVector frictionA = balloonA.velocity.get();
  frictionA.mult(-1);
  frictionA.normalize();
  frictionA.mult(0.03);
  
  PVector frictionC = balloonC.velocity.get();
  frictionC.mult(-1);
  frictionC.normalize();
  frictionC.mult(0.05);
  
  balloonA.applyForce(frictionA);
  balloonC.applyForce(frictionC);
  
  balloonA.applyForce(wind);
  balloonC.applyForce(wind);
  
  balloonA.applyForce(gravity);
  balloonC.applyForce(gravity);
  
  balloonA.update();
  balloonC.update();
  
  balloonA.checkEdges();
  balloonC.checkEdges();
  
  balloonA.display();
  balloonC.display();
}
