//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//GUI Example
//Forked from Generative Art Book by Matt Pearson

import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;
CheckBox checkbox;
int lineSize = 100;
int radiusSize = 200;
int transparency = 10;

boolean startRecord = false;
boolean iterateNew = true;

int centX = 400;
int centY = 400;

float x, y;

void setup() {
  size(800, 800);
  background(255);
  strokeWeight(0.5);   
  smooth();

  cp5 = new ControlP5(this);

  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("lineSize")
    .setPosition(100, 50)
    .setRange(0, 1000)
    ;

  cp5.addSlider("radiusSize")
    .setPosition(100, 70)
    .setRange(0, 2000)
    ;

  cp5.addSlider("transparency")
    .setPosition(100, 90)
    .setRange(0, 255)
    ;

  checkbox = cp5.addCheckBox("randomcolor")
    .setPosition(100, 110)
    .setSize(10, 10)
    .setItemsPerRow(3)
    .setSpacingColumn(30)
    .setSpacingRow(20)
    .addItem("0", 0)
    ;
}

void draw() {


  if (startRecord) {
    beginRecord(PDF, "filename.ai");
  }
  // Draw something good here
  if (iterateNew) {
    background(255);
    for (int i = 0; i<lineSize; i++) {    
      float lastx = -999;
      float lasty = -999;
      float radiusNoise = random(10);
      float radius = 10;
      float randomCol = checkbox.getItem(0).getValue();
      if (randomCol == 1) {
        stroke(random(30), random(30), random(30), transparency);
      } else {
        stroke(255, 0, 0, transparency); 
      }
      
      int startangle = int(random(360)); 
      int anglestep =  5 + int(random(3)); 
      for (float ang = startangle; ang <= 1440 + random(1440); ang += anglestep) {    
        radiusNoise += 0.05;
        radius += 0.5;
        float thisRadius = radius + (noise(radiusNoise) * radiusSize) - radiusSize*0.5;
        float rad = radians(ang);
        x = centX + (thisRadius * cos(rad));
        y = centY + (thisRadius * sin(rad));
        if (lastx > -999) {
          line(x, y, lastx, lasty);
        }
        lastx = x;
        lasty = y;
      }
    }
    iterateNew = false;
  }
  if (startRecord) {
    endRecord();
    startRecord = false;
  }
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    startRecord = true;
  }
  if (key == ' ') {
    iterateNew = true;
  }
}