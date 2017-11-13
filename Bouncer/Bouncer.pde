//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Bouncing Ball

int xCoor = 100; //initial x Position
int dx = 5; //x speed
int yCoor = 100; //initial y Position
int dy = 5; //y speed
int directionX = 1;
int directionY = 1;
int eDim = 40;

void setup() {
  size(640, 480);
}
void draw() {
  background(0);
  
  //direction reverses when the ball reaches to boundarier
  if (xCoor>width-eDim*0.5) {
    directionX = -1;
  }
  if (xCoor<eDim*0.5) {
    directionX = 1;
  }
  xCoor = xCoor + dx * directionX;
  
  if (yCoor>height-eDim*0.5) {
    directionY = -1;
  }
  if (yCoor<eDim*0.5) {
    directionY = 1;
  }
  yCoor = yCoor + dy * directionY;
  
  ellipse(xCoor, yCoor, eDim, eDim);
}