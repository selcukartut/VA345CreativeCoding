//Based on https://www.openprocessing.org/sketch/429904
//by Spencer Mathews
//Code adapted/developed by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Export vector graphics to Illustrator

import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;

int radiusValue = 0;
int levelValue = 0;
boolean pdfExport = false;

void setup()
{
  size(1500, 1500);
  background (256, 256, 256);

  cp5 = new ControlP5(this);


  cp5.addSlider("radiusValue")
    .setPosition(100, 50)
    .setRange(50, 500)
    .setSize(300, 20);
  ;

  cp5.addSlider("levelValue")
    .setPosition(100, 80)
    .setRange(5, 10)
    .setSize(300, 20);
  ;

  // create a new button with name 'generate'
  cp5.addButton("generate")
    .setValue(0)
    .setPosition(100, 110)
    .setSize(100, 20)
    ;

  // create a new button with name 'generate'
  cp5.addButton("exportasvector")
    .setValue(1)
    .setPosition(1300, 50)
    .setSize(100, 20)
    ;
}

void draw() {
}

// Circle splatter machine
void drawCircles(float x, float y, int radius, int level)
{

  noStroke();
  float tt = 126 * level / 6.0; 
  fill (tt, 0, 116);
  ellipse(x, y, radius*2, radius*2);
  if (level > 1) {
    level = level - 1;
    int num = int (random(2, 5));
    for (int i=0; i<num; i++) { 
      float a = random(0, TWO_PI);
      float nx = x + cos(a) * 60.0 * level; 
      float ny = y + sin(a) * 60.0 * level; 
      drawCircles(nx, ny, radius/2, level);
    }
  }
}

// function generate will receive changes from 
// controller with name generate
void generate(int theValue) {
  background(255);
  if (pdfExport) {
    beginRecord(PDF, "export.ai");
  }
  drawCircles(750, 750, radiusValue, levelValue);
  if (pdfExport) {
    endRecord();
    pdfExport = false;
  }
}

void exportasvector(int theValue) {

  pdfExport = true;
}