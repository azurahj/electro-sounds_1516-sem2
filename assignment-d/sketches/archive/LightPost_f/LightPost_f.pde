

// Minim Codes~
import ddf.minim.*;
Minim minim;
AudioInput ai;

HashMap<String, IScene> scenes;
String scene = "light-post";


void setup() {
  size(800, 600, P3D);
  noStroke();

  //Minim Codes~
  minim = new Minim(this);
  minim.debugOn();
  ai = minim.getLineIn(Minim.STEREO, width);
  
  //This 
  scenes = new HashMap();
  scenes.put("light-post", new Lightposts().setup());
  scenes.put("butterflies", new Butterflies().setup());
}


void draw() {
  println(ai.mix.level());
  
  background(0);

  pushMatrix();
  translate(width/2 - 180, height/2, 200);
  rotateX(-0.2);
  if (mouseButton == LEFT) {
    rotateY(-0.5);
  } else if (mouseButton == RIGHT) {
    rotateY(0.5);
  }
  translate(0, 0, -200);

  // start rendering scenes 
  scenes.get(scene).draw();
  // end rendering scenes

  popMatrix();
}


void keyPressed() {
  switch(key) {
    case('n'):scene = "butterflies";break;
    case('m'):scene = "light-post";break;
  }
  scenes.get(scene).keyPressed();
}