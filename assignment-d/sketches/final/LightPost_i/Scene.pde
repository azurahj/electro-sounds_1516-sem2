interface IScene {
  public IScene setup();
  public void draw(PGraphics pg);
  public void activate();
  public void keyPressed();
}

abstract class AScene implements IScene {
  public IScene setup() {return this;}
  public void draw(PGraphics pg) {}
  public void activate() {}
  public void keyPressed() {}
}