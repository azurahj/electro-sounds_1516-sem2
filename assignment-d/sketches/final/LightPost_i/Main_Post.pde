
class LightPost {

  int c;
  float x, y, z;
  float w, h, nw, nh;
  boolean showTriangle;
  boolean showRect;

  /*For the code to work it has to be 2^(x)*/
  final static int FLKR = 1; //2^0
  final static int TRI = 2; //2^1
  final static int REE = 4; //2^2
  final static int RAN = 8; //2^3

  int mode = 1;

  LightPost(float theX, float theY, float theZ ) {
    x = theX;
    y = theY;
    z = theZ;
    w = 10;
    h = 200;
  }

  void update() {
    h += (nh-h)*0.1;
  }

  /*For every translate or an action within the mode
   * You have to add push&popMatrix();
   */
  void draw(PGraphics pg) {
    pg.pushMatrix();
    pg.translate(x, y, z);

    if (isModeActive(FLKR)) {
      pg.fill(255);
      pg.rect(0, 0, w, -h);
    }

    if (isModeActive(TRI)) {
      pg.pushMatrix();
      pg.translate(0, 0, 1);
      pg.fill(random(255));
      pg.triangle(0, 0, w/2, -h, w, 0);
      pg.popMatrix();
    }

    if (isModeActive(REE)) {
      pg.pushMatrix();
      pg.translate(0, 0, 1);
      pg.fill(0);
      pg.rect(4, 1, w/3, -h/2);
      pg.popMatrix();
    }
    if (isModeActive(RAN)) {
      for (int i = 0; i < 100; i++) {
        float r = random(20);
        pg.stroke(255, r*10);
        //stroke(r*5);
        pg.strokeWeight(1);
        pg.line(0, -i, 2.5+r, -i); // x1,y1,x2,y2
      }
    }
    pg.popMatrix();
  } 
  
  boolean isModeActive(int theMode) {
    return (mode & theMode)>0;
  }

  void switchMode(int theMode) {
    mode ^= theMode;
  }

  void trigger(int theType) {
    switch(theType) {
      case(1):
      h = 0;
      nh = 100;
      break;
    }
  }
}