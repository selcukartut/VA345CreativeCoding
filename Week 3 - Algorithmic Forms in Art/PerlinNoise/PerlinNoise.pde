//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Perlin Noise applied on a Movement of a Ball

float t;
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  background(0);
  float n = noise(t);
  float x = map(n, 0, 1, 0, width);
  ellipse(x, 180, 16, 16);
  t += 0.01;
}