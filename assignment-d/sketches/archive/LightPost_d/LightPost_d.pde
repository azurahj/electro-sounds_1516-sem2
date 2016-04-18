ArrayList<LightPost> lights;

// Minim Codes~
import ddf.minim.*;
Minim minim;
AudioInput ai;





void setup() {
  size(800, 600, P3D);
  //fullScreen();
  noStroke();
  
  //Minim Codes~
  minim = new Minim(this);
  minim.debugOn();
  ai = minim.getLineIn(Minim.STEREO, width);
  
  lights = new ArrayList();
  for (int x = 0; x<5; x++) {
    for (int y = 0; y<5; y++) {
      lights.add(new LightPost(x*90, 0, y*60));
    }
  }
}


void draw() {
  background(0);
  pushMatrix();
  translate(width/2 - 180, height/2, 200);
  rotateX(-0.2);
  if (mousePressed) {
    rotateY(-0.5);
  }
  translate(0, 0, -200);
  
  //Determine the rate of the flicker
  for (LightPost light : lights) {
    light.update();
    light.draw();
    if (frameCount % 80==0) {
      light.trigger(1);
    }
  }
  popMatrix();
}

/*Take note of 2 different modes
* One is 'mode' the other is 'type'
*/
void keyPressed() {
  int type = 0;
  int mode = 0; 
  switch(key) {
    case('1'):type=1;break;
    case('m'):mode = LightPost.FLKR;break;
    case('3'):mode = LightPost.TRI;break;
    case('2'):mode = LightPost.REE;break;
  }
  // Below represents the else,if statements
  for (LightPost light : lights) {
    light.trigger(type);
    light.switchMode(mode);
  }
}