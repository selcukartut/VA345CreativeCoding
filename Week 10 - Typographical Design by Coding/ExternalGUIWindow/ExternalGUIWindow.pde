//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//GUI Example
//Forked from Generative Art Book by Matt Pearson

import controlP5.*;
ControlFrame cf;

float theta;   
float angle;

void settings() {
  size(1200, 1200,P3D);
   
}
void setup() {
  cf = new ControlFrame(this, 400, 50, "Controls");
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  // Convert it to radians
  theta = radians(angle);
  // Start the tree from the bottom of the screen
  translate(width/2, height);
  // Draw a line 120 pixels
  line(0, 0, 0, -120);
  // Move to the end of that line
  translate(0, -120);
  // Start the recursive branching!
  branch(440);
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;

  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}