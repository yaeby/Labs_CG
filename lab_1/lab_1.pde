boolean isDay = true;

void setup() {
  size(400, 400);
}

void draw() {
  if (isDay) {
    // Draw a blue sky background
    background(#87CEEB);
    
    // Draw a sun
    fill(#FFFF00);
    ellipse(100, 100, 90, 90);
    
    // Draw ground
    fill(#5EC60A);
    rect(0, 300, width, height - 300);
    
    // Draw house
    fill(#E3E3E3);
    rect(150, 200, 100, 100);
    fill(#8E5211);
    triangle(150, 200, 200, 150, 250, 200);
    
    // Draw door
    fill(#8E5211);
    rect(180, 250, 40, 50);
    fill(#0F0F0E);
    ellipse(212, 280, 4, 4);
    
    // Draw windows
    fill(#ACFAF5);
    rect(160, 220, 30, 30);
    rect(210, 220, 30, 30);
    
    // Draw tree
    fill(#6F3C04);
    rect(300, 200, 20, 100);
    fill(#318607);
    ellipse(310, 180, 90, 120);
  }else{
    // Draw dark sky background
    background(#060440);
    
    // Draw moon
    fill(#E39820);
    arc(100, 100, 90, 90, 1, 3.8, CHORD);
    
    // Draw ground
    fill(#285F0B);
    rect(0, 300, width, height - 300);
    
    // Draw a house
    fill(#757676);
    rect(150, 200, 100, 100);
    fill(#5D3014);
    triangle(150, 200, 200, 150, 250, 200);
    
    // Draw door
    fill(#5D3014);
    rect(180, 250, 40, 50);
    fill(#0F0F0E);
    ellipse(212, 280, 4, 4);
    
    // Draw windows
    fill(#0762DE);
    rect(160, 220, 30, 30);
    rect(210, 220, 30, 30);
    
    // Draw tree
    fill(#270D01);
    rect(300, 200, 20, 100);
    fill(#023B0D);
    ellipse(310, 180, 90, 120);
  }
}

void mouseClicked() {
  // Toggle between day and night when the mouse is clicked
  isDay = !isDay;
}
