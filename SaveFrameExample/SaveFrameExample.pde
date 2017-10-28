//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Using saveFrame function to save a snapshot as bitmap image

void setup() {
  size(1200, 1750);
}

void draw() {

  background(0);
  smooth();
  float dx = 500 * sin(frameCount/50.0);
  noStroke();

  pushMatrix();
  translate(width*0.5, height*0.5);

  for (int i = 0; i < 500; i++) {
    rotate(frameCount/1000.0);
    fill(255-i/50.0,0,0);
    rect(0, 0, i, 5);
  }
  popMatrix();

  pushMatrix();
  translate(width*0.5, height*0.5);
  scale(5*cos(frameCount/100.0));
  for (int i = 0; i < 5; i++) {
    fill(255-i*50, 0, 0,155-i*5);
    ellipse(0, 0, 150-i*25, 150-i*25);
  }
  popMatrix();
}

void keyPressed()
{ 
  // hit p on your Keyboard to save snapshot as png
  if(key == 'p' || key == 'P'){
    saveFrame("snapshot.png");
  }
}