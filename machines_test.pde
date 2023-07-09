void setup(){
  size(400,400);
  background(100);
  smooth();
  stroke(0,0,250);

}

void draw(){
 drawGrid();
 drawNoiseBox(0, 0);
 drawGear(300,100);
 //drawBorder(0,0);
 //colorGrid(0,0);
 pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 200.0);
  star(0, 0, 40, 50, 20); 
  popMatrix();
  
 
 //pushMatrix();
  //translate(width*0.2, height*0.5);
  //rotate(frameCount / 200.0);
  //star(0, 0, 5, 70, 3); 
  //popMatrix();
 }

void drawNoiseBox(int x, int y){
   int[] array = {0, 50, 100, 150, 200, 250, 300, 350, 400};
 int c = 0;
 
 
 for (int i = 0; i < 100; i++) {
  float r = random(50);
  stroke(r*5);
  line(50, i, 50 + r, i);
  line(50, i, 50 - r, i);
    }
}

void drawGear(int x, int y){
  //rectMode(CENTER);
  //rect(x, y, 15, 70);
 // rect(x, y, 70, 15);
 // ellipse(x, y, 50, 50);
 // fill(color(204, 102, 0));
  
  
  
}

void colorGrid(int x, int y){
  loadPixels();
  for (int i = 0; i < 140000; i++){
  
    pixels[i] = color(255, 102, 204);
  
}
updatePixels();
}

void drawGrid(){
   // Initialize columns and rows
  int videoScale = 25;
  int cols = width/videoScale;
  int rows = height/videoScale;
   // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x, y, videoScale, videoScale);
    }
  }
}
 
 void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
} 


