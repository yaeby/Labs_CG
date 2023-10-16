float xOff = 0.0;
float yOff = 0.0;
float increment = 0.02;

void setup() {
  size(400, 400);
  background(255);
  noiseSeed(1); // Set a specific seed for the noise
  noiseDetail(4); // Set noise detail to control the complexity
}

void draw() {
  loadPixels();

  for (int x = 0; x < width; x++) {
    xOff += increment;
    yOff = 0.0;
    
    for (int y = 0; y < height; y++) {
      yOff += increment;
      float n = noise(xOff, yOff); // Generate Perlin noise value

      // Map the noise value to a grayscale color
      int bright = int(map(n, 0, 1, 0, 255));

      // Set pixel color based on the mapped value
      pixels[x + y * width] = color(bright);
    }
  }

  updatePixels();
}
