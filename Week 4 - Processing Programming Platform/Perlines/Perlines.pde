//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Perlines

PerlinLine[] perlines = new PerlinLine[7];


int distY = 100;
int lineSize = 7;
float xoffIncr = 0.01;
float yoffIncr = 0.07;

float strokeW = 10;

void setup() {
  size(1024, 600);
  for(int i = 0; i < lineSize ; i++){
    perlines[i] = new PerlinLine(85*i, i*distY);
  }
  
}

void draw() {
  background(0);
  noFill();
  strokeWeight(strokeW);
  stroke(255);
  if(second()%10==0){
    xoffIncr = random(0.05);
    yoffIncr = random(0.1);
  }
  for(int i = 0; i < lineSize ; i++){
    perlines[i].update();
  }
  
}

class PerlinLine { 
  float yoff = 0.0;
  float yPos, xoffInit;
  PerlinLine (float yLoc, float incr) {
    yPos = yLoc;
    xoffInit = incr;
  } 
  void update() { 


    beginShape();
    float xoff = xoffInit;
    for (float x=0; x<=width; x+=10) {
      float y = map(noise(xoff, yoff), 0, 1, yPos, yPos+100);
      // Set the vertex
      vertex(x, y); 
      // Increment x dimension for noise
      xoff += xoffIncr;
    }
    yoff += yoffIncr;
    endShape();
  }
}