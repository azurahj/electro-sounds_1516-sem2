class Butterflies extends AScene {
  
  IScene setup() {
    return this;
  }
  
  void draw(PGraphics pg) {
    pg.background(random(255));
  }
}