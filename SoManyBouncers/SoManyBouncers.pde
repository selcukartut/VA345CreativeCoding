//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Bouncing Many Balls with Classes Implemented

Ball[] mBalls;
int ballSize = 400;
color [] colorArray;

void setup() {
  size(1000, 1000);
  colorArray = new color[6];
  colorArray[0] = color(0, 119, 204);
  colorArray[1] = color(0, 45, 76);
  colorArray[2] = color(66, 152, 212);
  colorArray[3] = color(105, 128, 145);
  colorArray[4] = color(0, 90, 153);
  colorArray[5] = color(250, 0, 3);

  mBalls = new Ball[ballSize];
  for (int i = 0; i < mBalls.length; i++) {
    mBalls[i] = new Ball();
    int colIndex = i % colorArray.length;
    mBalls[i].defaultCol = colorArray[colIndex];
  }
}
void draw() {
  background(0);
  for (int i = 0; i < mBalls.length; i++) {
    
    mBalls[i].move();
  }
}