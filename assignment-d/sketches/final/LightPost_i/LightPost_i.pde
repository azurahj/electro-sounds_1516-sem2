/* 
Title: Light Post
Done by: Azurah Jan, Year 2 student from Lasalle College of the Arts,
(BA) Music Technology.
Idea from: imposition, Daneil Schwarz "http://danielschwarz.cc/imposition/"
Thanks to Andreas for guiding me and helping me with my codes :)
*/

// Syphon Code
import codeanticode.syphon.SyphonServer;

SyphonServer syphon;

void settings() {
  size(960, 540, P3D);
  PJOGL.profile=1;
}


//Minim Player Code
import ddf.minim.*;
Minim minim;
AudioPlayer song;

// Minim Codes~
//import ddf.minim.*;
//Minim minim;
//AudioInput ai;

HashMap<String, IScene> scenes;
String scene = "light-post";


void setup() {
  noStroke();
  
 //Syphon Code
  syphon = new SyphonServer( this, "lightpost" ); /* create a syphon instance*/
  buffer = createGraphics(width,height,P3D); /* create a buffer */

  //Minim Codes~
  //minim = new Minim(this);
  //minim.debugOn();
  //ai = minim.getLineIn(Minim.STEREO, width);
  
  //Minim player code
  minim = new Minim(this);
  song = minim.loadFile("Processing song.mp3", 1024);
  // loop the file indefinitely
  song.loop();
  
  //These are the diffeent scence
  scenes = new HashMap();
  scenes.put("light-post", new Lightposts().setup());
  scenes.put("butterflies", new Butterflies().setup());
}

PGraphics buffer;

void draw() {
  //println(ai.mix.level());
  println(song.mix.level());
  
  background(0);
  
  /* then, use a PGraphics buffer to draw into */
  buffer.beginDraw(); /* start drawing into the buffer */
  buffer.background(0);
  //buffer.translate(width/2, height/2, 200);
  

  buffer.pushMatrix();
  buffer.translate(width/2 - 180, height/2, 200);
  buffer.rotateX(-0.2);
  if (mouseButton == LEFT) {
    buffer.rotateY(-0.5);
  } else if (mouseButton == RIGHT) {
    buffer.rotateY(0.5);
  }
  buffer.translate(0, 0, -200);

  // start rendering scenes 
  scenes.get(scene).draw(buffer);
  // end rendering scenes

  buffer.popMatrix();
  
  buffer.endDraw(); /* finish drawing into the buffer */
  
  /* after all the drawing is finished, render the buffer to the screen*/
  image(buffer, 0, 0);
  
  /* finally send the buffer over to syphon */
  syphon.sendImage( buffer );

}


void keyPressed() {
  switch(key) {
    case('n'):scene = "butterflies";break;
    case('m'):scene = "light-post";break;
  }
  scenes.get(scene).keyPressed();
}