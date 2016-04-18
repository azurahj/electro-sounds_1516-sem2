// First set the variables to draw the squares and the randomness

int Rows;
int Colum;
float squareSides; //length of square sides
float Pad; //padding
float rowRandom; //how random you want the squares

//Now we setup the main body

void setup(){
 //Note only this chunk can only be written in setup
 int drawHeight = 150; // Max height the squares will stop
 float widthHeightRatio = 1.6; //1.6
 int drawWidth = int(drawHeight * widthHeightRatio); //~250
  size(960, 540); //Set the size of canvas
 
 rowRandom = 50.0; //higher number means more order,vice-versa 
 
//Set the padding for the lenth for the squares
  float PadRatio = 0.2;
  Pad = drawWidth * PadRatio; //~35
  squareSides = Pad/2; //  ~17.5
 
 noLoop(); //no animation
 noFill(); //only outlines

}

void draw(){
   smooth();
   background(255);

 
    Colum = 34; //Represents the squares going right
    Rows = Colum/2; //Represents the squares going down
 
//Set the numder of columns and rows you want
  for(int currentColum = 0; currentColum <= Colum; currentColum++){
    for(int currentRow = 0; currentRow <= Rows; currentRow++){
    //Use pushmatrix to stack the squares at the original position
      pushMatrix();
      float leftRight = Pad + (currentColum * squareSides); //Direction of column
      float topDown = Pad + (currentRow * squareSides); //Direction of rows
      translate(leftRight, topDown); //This represents a specific position
 
 //Calculate rotational change for canvas to shift square angle
       float lowRandom = PI*currentRow/(-1*rowRandom);
       float highRandom = PI*currentRow/rowRandom;
       float angleShift = random(lowRandom, highRandom);
       rotate(angleShift);
       
       rect(0, 0, squareSides, squareSides);
 
 //End of wtv
        popMatrix();
    }
  }
}