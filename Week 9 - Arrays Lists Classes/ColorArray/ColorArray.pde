//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Arrays discussed
//Rect width is determined by mouseX when clicked

color [] colorArray;
float rectWidth = 8;

void setup() {
  size(1200, 1000);
  colorArray = new color[6];
  colorArray[0] = color(0, 119, 204);
  colorArray[1] = color(0, 45, 76);
  colorArray[2] = color(66, 152, 212);
  colorArray[3] = color(105, 128, 145);
  colorArray[4] = color(0, 90, 153);
  colorArray[5] = color(250, 0, 3);
}

void draw() {
  noStroke();
  background(0);

  for (int i = 0; i < width/rectWidth; i++) {
    int mod = i % colorArray.length;
    fill(colorArray[mod]);
    pushMatrix();
    translate(i*rectWidth, 0);
    rect(0, 0, rectWidth, 1000);
    popMatrix();
  }
}

void mousePressed() {
  rectWidth = mouseX / 10.0;
}
