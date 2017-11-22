//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Based on Future Learn Creative Coding Tutorials www.futurelearn.com

int largeCircleR = 100;
int smallCircleR = 80;

color largeCircleCol;
color smallCircleCol;
color rectCol;

void setup(){
  size(501,501);
  largeCircleCol = color(random(255), 153, 0);
  smallCircleCol = color(random(255), 153, 0);
  rectCol = color(155+random(100), 0, 0);
}

void draw(){
  background(0);
  smallCircleR = mouseX;
  largeCircleR = mouseY;
  println(smallCircleR);
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      noFill();
      stroke(largeCircleCol);
      //large circle
      ellipse(50+i*100, 50+j*100, largeCircleR, largeCircleR);
      stroke(rectCol);
      rect(0+i*100, 0+j*100, 100, 100);
      //small circle
      stroke(smallCircleCol);
      ellipse(100+i*100, 100+j*100, smallCircleR, smallCircleR);
    }
  }
  
  
}
