/* Title of work: Coloured Bottles.
*  Done by: A.J, (Ba) Music Technology, Year 2, Lasalle College of The Arts
*  Vimeo link: https://vimeo.com/158017700
*  Modified from Andy's class example 'jObjectsAgain_c.pde'
* 
*/

ArrayList<Bottle> os = new ArrayList();
PImage colors;



void setup() {
  size(960, 540, P3D);
  colors = loadImage("watz01s.jpg");
  noStroke();
  for (int i=0; i<400; i++) {
    os.add(new Bottle(i));
  }
  background(255);
}




/*This draws the main background colour and how I would want to position my objects*/
void draw() {
  background(0);
  translate(width/2, height/2, 200);
  
  for (Bottle o : os) {
    o.move();
    o.draw();
  }

}

/* This allows the changes of the colours to be based on the image library I created */
void keyPressed() {
  switch(key) {
    case('1'):
    colors = loadImage("2012-ducati-panigale-1199-preview 5.jpg"); 
    break;
    case('2'):
    colors = loadImage("watz01s.jpg"); 
    break;
    case('3'):
    colors = loadImage("SystemC_041128_130001_02.jpg"); 
    break;
  }
}