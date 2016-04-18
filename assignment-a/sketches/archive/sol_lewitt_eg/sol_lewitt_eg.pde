void setup() {
  size(960,540);
  background(255);
  smooth();
  strokeWeight(8);
  frameRate(2);
}
 
void draw() {
 
 
 
  /*These lines are the fixed contraints that frame my composition. They subdivided
   my sketch using multiples of 1/3 of the width and height of the sketch window. This
   is used to create a clear since of controlled paramaters for the variables within the
   multiple iterations I want to explore.*/
 
  line(width/3, 0, width/3, 2*(height/3));
  line(width/3, (height/3), width, height/3);
  line(0,2*(height/3), width, 2*(height/3));
 
  fill(random(40,255),random(40,255),0,85);
 
  // This is the nested loop for the rectangle variations.
 
  for(int rectX = 0; rectX< width; rectX+= random(width/3, 2*(width/3))) {
    for(int rectY=0; rectY< height; rectY+=random(height/3, 2*(height/3))) {
      rect(rectX, rectY, random(width/3, 2*(width/3)), random(height/3, 2*(height/3)));
    }
  }
} 
void mousePressed() {
  background(255);
  if (mouseButton == RIGHT) {
    noLoop();
  }
}