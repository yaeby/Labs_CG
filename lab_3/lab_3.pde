/*
MADE BY ADRIAN COPTA | FAF-223
*/


// Declare an array to hold PShape objects and the number of shapes
PShape[] shapes;
int numShapes = 10;

void setup() {
  // Create a 3D canvas of size 400x400 pixels
  size(400, 400, P3D);

  // Initialize the array to hold PShape objects
  shapes = new PShape[numShapes];
  
  // Create PShape objects and store them in the array
  for (int i = 0; i < numShapes; i++) {
    int choice = int(random(3));
    if (choice == 0) {
      shapes[i] = createSphere();
    } else if (choice == 1) {
      shapes[i] = createBox();
    } else {
      shapes[i] = createQuad();
    }
  }
}

void draw() {
  // Set the background color to light gray
  background(200);

  // Translate the coordinate system to the center of the canvas
  translate(width / 2, height / 2, 0);

  // Calculate the length of the main diagonal of the canvas
  float diagonal = sqrt(sq(width) + sq(height));

  // Loop through the array of shapes
  for (int i = 0; i < numShapes; i++) {
    // Calculate the x, y, and z positions for each shape based on time and index
    float x = map(sin(radians(frameCount + i * 15)), -1, 1, -width / 2, width / 2);
    float y = map(cos(radians(frameCount + i * 20)), -1, 1, -height / 2, height / 2);
    float z = map(sin(radians(frameCount + i * 10)), -1, 1, -diagonal / 2, diagonal / 2);
    
    // Push the current transformation matrix onto the stack
    pushMatrix();
    
    // Translate and rotate each shape
    translate(x, y, z);
    rotateX(radians(frameCount));
    rotateY(radians(frameCount));
    
    // Display the current shape from the array
    shape(shapes[i]);
    
    // Restore the previous transformation matrix
    popMatrix();
  }
}

// Function to create a random colored sphere
PShape createSphere() {
  PShape s = createShape(SPHERE, 50);
  s.setFill(color(random(255), random(255), random(255)));
  return s;
}

// Function to create a random colored box
PShape createBox() {
  PShape b = createShape(BOX, 80);
  b.setFill(color(random(255), random(255), random(255)));
  return b;
}

// Function to create a random colored quad
PShape createQuad() {
  PShape q = createShape(QUAD, -40, -40, 40, -40, 40, 40, -40, 40);
  q.setFill(color(random(255), random(255), random(255)));
  return q;
}
