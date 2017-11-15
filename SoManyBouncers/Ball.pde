class Ball {

  float xCoor = random(1000); //initial x Position
  float dx = random(5); //x speed
  float yCoor = random(1000); //initial y Position
  float dy = random(5); //y speed
  float directionX = -1+2*int(random(2)); // in order to get -1 or 1, I have multiplied with 2 to get 0 or 2, addition equals -1 and 1
  float directionY = -1+2*int(random(2));
  float eDim = random(5,56);
  color defaultCol = color(255,255,255,255);

  void move() {

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
    fill(defaultCol);
    ellipse(xCoor, yCoor, eDim, eDim);
  }
}