
class Lightposts extends AScene {

  ArrayList<LightPost> lights;

  IScene setup() {
    lights = new ArrayList();
    for (int x = 0; x<5; x++) {
      for (int y = 0; y<5; y++) {
        lights.add(new LightPost(x*90, 0, y*60));
      }
    }
    return this;
  }

  void draw() {
    for (LightPost light : lights) {
      light.update();
      light.draw();
      // if (frameCount % 80==0) {
        if(ai.mix.level()>0.1) { // This represents the minim function.
          light.trigger(1);
        }
      //}
    }
  }

  void keyPressed() {
    int type = 0;
    int mode = 0; 
    switch(key) {
      case('1'):
      type=1;
      break;
      case('2'):
      mode = LightPost.FLKR;
      break;
      case('3'):
      mode = LightPost.TRI;
      break;
      case('4'):
      mode = LightPost.REE;
      break;
      case('8'):
      mode = LightPost.RAN;
      break;
    }
    // Below represents the else,if statements
    for (LightPost light : lights) {
      light.trigger(type);
      light.switchMode(mode);
    }
  }
}