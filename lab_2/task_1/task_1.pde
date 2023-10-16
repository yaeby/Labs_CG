/*
MADE BY ADRIAN COPTA | FAF-223
*/

float x, y; // Position of the rectangle
int rx, ry; // Half of the width and half of the height of the rectangle

void setup() {
  size(400, 400);
  background(255, 255, 0); // Yellow background
  
  // Calculate the center of the sketch using width and height
  x = width / 2;
  y = height / 2;
  
  // Set half of the width and half of the height of the rectangle
  rx = 160; // Half of 320
  ry = 190; // Half of 380
  
  stroke(0); // Set stroke color to black
  strokeWeight(2); // Set line thickness to 2
  
  // Draw the rectangle with borders
  rectMode(CENTER);
  noFill(); // No fill for the rectangle
  rect(x, y, rx * 2, ry * 2);
  
  // Draw diagonals
  line(x - rx, y - ry, x + rx, y + ry);
  line(x - rx, y + ry, x + rx, y - ry);
  
  // Draw middle lines
  line(x - rx, y, x + rx, y);
  line(x, y - ry, x, y + ry);
}

void draw() {
  // Set the stroke weight and color for the new shapes
  strokeWeight(3);
  
  // Draw an arc in quadrant II
  stroke(255, 0, 0); // Red color
  arc(x, y, rx * 2, ry * 2, PI, PI + HALF_PI);
  
  // Draw a chord
  stroke(0, 255, 0); // Green color
  float startAngle = PI; // Middle of quadrant IV
  float endAngle = PI*2+HALF_PI/2; // Start of quadrant III
  arc(x, y, (rx-5) * 2, (ry-5) * 2, startAngle, endAngle, CHORD);
  
  // Draw a pie
  stroke(0, 0, 255); // Blue color
  arc(x, y, (rx - 10) * 2, (ry - 10) * 2,HALF_PI + HALF_PI / 2, PI*2, PIE);
  
  noLoop(); // Stop draw loop
}
