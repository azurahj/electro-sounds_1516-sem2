class Bottle {

  float x = 0;
  float y = 200;
  float z = 0;
  float s = 10;

  float speed = 0;

  int col = 0;
  int colX = int(random(colors.width));
  int colY = 150;


  Bottle(float theY) {
    y = theY;
    z = random(-100, 200); //-400, 400
    s = 10; //10
    speed = random(-0.5, 3.0); //0.5,3.0
  }

  void move() {

    colY+=1;
    colY %= colors.height;

    x = x + speed;
    if (x<0 || x>width) {
      speed *= -1;
    }
  }


  void draw() {
    col = colors.get(colX, colY);
    
    /*To add more variation is by playing around with the alpha
    *Eg1:(sin(frameCount*speed*0.01)*30); 
    */
    float alpha = ((frameCount*speed*0.05)*30);
    fill(col, alpha);
    pushMatrix();
    rotateZ(frameCount*0.01);
    translate(0, y, z);
    
    /*This determins the size of the main rotating bottle
    * Eg1: 1,100,1
    *Eg2: s,50,100
    */
    box(s, 50, 100); // w:x-dimension,h: y-dimension,d: z-dimension
    popMatrix();
  }
}