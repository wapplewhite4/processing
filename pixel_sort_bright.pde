PImage img;
float brightnessThreshold = 100; // Adjust this threshold value as needed

void setup() {
  size(800, 600);
  img = loadImage("image.jpg");  // Replace "image.jpg" with the path to your image
  img.resize(width, height);
  image(img, 0, 0);
  sortPixels();
}

void sortPixels() {
  img.loadPixels();
 
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width - 1; x++) {
      int index1 = x + y * img.width;
      int index2 = (x + 1) + y * img.width;
     
      float brightness1 = brightness(img.pixels[index1]);
      float brightness2 = brightness(img.pixels[index2]);
     
      // Check if both pixels are above the brightness threshold
      if (brightness1 > brightnessThreshold && brightness2 > brightnessThreshold) {
        // Swap pixels if the next pixel is brighter
        if (brightness2 > brightness1) {
          swapPixels(index1, index2);
         
          // If a swap occurs, move back one pixel to recheck the previous pixels
          if (x > 0) {
            x -= 2;
          } else {
            x--; // If x = 0, move back by 1 to avoid going out of bounds
          }
        }
      }
    }
  }
 
  img.updatePixels();
  image(img, 0, 0);
}

void swapPixels(int index1, int index2) {
  int temp = img.pixels[index1];
  img.pixels[index1] = img.pixels[index2];
  img.pixels[index2] = temp;
}

void draw() {
  // Draw the sorted image
  image(img, 0, 0);
}
