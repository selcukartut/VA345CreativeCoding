//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Based on Future Learn Creative Coding Tutorials www.futurelearn.com

int dEllipseB = 150; //big ellipse diameter equal to square size
int dEllipseS = 0; //small ellipse diameter
float xEllipseB, yEllipseB;
float xEllipseS, yEllipseS;

void setup() {
  size(1200, 1200);
}
void draw() {
  background(0);
  noFill();
  dEllipseS = mouseY; // change small ellipse diameter according to mouse'y pos
  for (int k = 0; k < 8; k++) {
    for (int i = 0; i < 8; i++) {
      strokeWeight(3);
      stroke(123,0,0); // reddish stroke
      xEllipseB = dEllipseB*0.5 + i * dEllipseB;
      yEllipseB = dEllipseB*0.5 + k * dEllipseB;
      ellipse(xEllipseB, yEllipseB , dEllipseB, dEllipseB);
      stroke(80,85,0); // rectangles in yellowish stroke
      rect(i * dEllipseB, k * dEllipseB, dEllipseB, dEllipseB); // same size as big circle
      stroke(0,120,0); // greenish stroke
      xEllipseS = dEllipseB + i * dEllipseB;
      yEllipseS = dEllipseB + k * dEllipseB;
      ellipse(xEllipseS, yEllipseS, dEllipseS, dEllipseS);
    }
  }
}
