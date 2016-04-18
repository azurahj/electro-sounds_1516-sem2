class Scary extends AScene {
  
float margin = 100;//50
float base;
float baseStep = 0.5; //1.3
float y[];
float gray;
float gStep = 0.5;//0.3

    AScene setup() {
       return this;
  gray = 0;
  base = 0;
  y = new float[width];
  for(int i = 0; i < width; i++){
    y[i] = 0;
    }
  }
  
 void draw() {
  stroke(gray);
  beginShape();
  for(int i = 0; i < width; i++){
    vertex(i, base + y[i]);
  }
  endShape();
   
  for(int i = 0; i < width; i++){
    y[i] += map(random(1), 0, 1, -0.3, 0.3);
  }
   
  base += 1;
  if(base > height + margin){
    base = -margin;
  }
   
  gray += gStep;
  if(gray > 255){
    gStep *= -1;
  } else if(gray < 0){
    gStep *= -1;
  }
}