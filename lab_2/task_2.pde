/*
MADE BY ADRIAN COPTA | FAF-223
*/

float rectX;         // x-coordinate of the rectangle
float rectY;         // y-coordinate of the rectangle
float rectWidth = 80;  // Width of the rectangle
float rectHeight = 50;  // Height of the rectangle
float rectSpeedX = 2;  // Speed in the x-direction
float rectSpeedY = 2;  // Speed in the y-direction
color rectColor;      // Color of the rectangle

void setup() {
  size(400, 400);
  rectX = random(width - rectWidth);
  rectY = random(height - rectHeight);
  rectColor = color(random(255), random(255), random(255));
}

void draw() {
  background(0);
  
  // Call the custom function to draw the bouncing rectangle
  drawBouncingRectangle(rectX, rectY, rectWidth, rectHeight, rectColor);
  
  // Update the rectangle's position based on speed
  rectX += rectSpeedX;
  rectY += rectSpeedY;
  
  // Check for collisions with the canvas boundaries
  if (rectX <= 0 || rectX >= width - rectWidth) {
    rectSpeedX *= -1;  // Reverse the horizontal direction
    rectColor = color(random(255), random(255), random(255)); // Change color on collision
  }
  if (rectY <= 0 || rectY >= height - rectHeight) {
    rectSpeedY *= -1;  // Reverse the vertical direction
    rectColor = color(random(255), random(255), random(255)); // Change color on collision
  }
}

// Custom function to draw a bouncing rectangle
void drawBouncingRectangle(float x, float y, float width, float height, color fillColor) {
  fill(fillColor);
  rect(x, y, width, height);
}
