/*Modified from Processing example "Space junk" */

//MIDI MAPPER
import sojamo.midimapper.*;

MidiMapper midi;
AssignedDevice korg;

//PEASY CAM
//import peasy.*;
//PeasyCam cam;


// Used for oveall rotation
float angle;
float a;
float b;
float c;
float d;
float e;


// Cube count-lower/raise to test performance
int limit = 1000; //500

// Array for all cubes
Cube[] cubes = new Cube[limit];

void setup() {
  size(960, 540, P3D); 
  
  /*Below are codes for midi mapper*/
  MidiMapper midi = new MidiMapper(this);
  
  /* list all available Midi devices */
  println(midi.list());
  
   /* find all devices that contain Korg in their name or info. this differs from OS to OS.*/
  println(midi.find("Korg"));
  
  /* connect Midi Mapper to a midi device and assign members of this sketch to midi events. */
  korg = midi.connect("SLIDER/KNOB");
  
  /* lets assign member a and b of this sketch each to a midi control, here note 16 and 17 */
  korg.assign(16).to("a").assign(17).to("b").assign(0).to("c").assign(1).to("d");
  korg.assign(2).to("e");
  
    /* use midi.test() to print each midi event of a device into the console */
  midi.test(korg);
    
  
 /*Below are peasy cam codes! */
  //cam = new PeasyCam(this, 10);
  //cam.setMinimumDistance(5);
  //cam.setMaximumDistance(1000);
  //fullscreen();
  //background(0); 
  noStroke();

  // Instantiate cubes, passing in random vals for size and postion
  for (int i = 0; i < cubes.length; i++){
    cubes[i] = new Cube(int(random(-10, 10)), int(random(-10, 10)), 
                        int(random(-50, 50)), int(random(-140, 140)), 
                        int(random(-140, 140)), int(random(-140, 140)));
  }
}

void draw(){
  background(c, d, e); 
  fill(200);
  

  // Set up some different colored lights, First 3 numbers are RGB, followed by x,y,z axis
  pointLight(28, 186, 232, 35, 40, 36); //51,102,255,65,60,100
  pointLight(28, 232, 230, -36, -60, -155); //200,40,60,-65,-60,-150

  // Raise overall light in scene 
  ambientLight(100, 50, 40); //70,70,10

  // Center geometry in display windwow.
  // you can changlee 3rd argument ('0')
  // to move block group closer(+) / further(-)
  //translate(width/2, height/2, -200 + mouseX * 0.65);
  translate(width/2, height/2, 0);

  // Rotate around y and x axes
  rotateX(map(a, 0, 127, -PI, PI));
  rotateY(map(b, 0, 127, -PI, PI));
  //rotateY(radians(angle));
  //rotateX(radians(angle));

  // Draw cubes
  for (int i = 0; i < cubes.length; i++){
    cubes[i].drawCube();
  }
  
  
  // Used in rotate function calls above
  angle += 0.5; //0.2
}