// Create the variables
float x = 0;

void setup() {
  size(960, 540);
  background(0);
  stroke(255);
}

void change_line_color() {
  //stroke(255, 0, 0);
  line(x, 100, x, 200);
  // now we decide if to use black or white
  if (random(100) > 20) {
    stroke(0); //black colour
  } else if(random(100) > 70) {
    stroke(209, 209, 209); //grey colour
  } else {
    stroke(255); //white colour
  }
 
}

void draw() {
  // draw black or white line
  line(x, 500, x, 50); //length of the lines

  // sometimes we decide to change the line color
  if (random(100) > 90) {
    change_line_color();
  }
  x = x + 1; //the line will keep going until reach the width
  if (x > width) {
    x = 0; //once max width is met,goes back to 0
  }
}