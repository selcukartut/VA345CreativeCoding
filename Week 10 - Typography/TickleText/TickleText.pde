//Code written by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017
//Use of Text - Tickling when mouse over

PFont f;
float w;
float x, y;
int fontS;

void setup() {

  size(1000, 1000);
  x = 100;
  y = 500;
  fontS = 32;
  f = createFont("Lato-Bold.ttf", fontS);
  textFont(f);
}


void draw() {
  background(0);
  fill(255);
  String s = "HELLO WORLD";
  text(s, x, y);
  w = textWidth(s);
  noFill();
  stroke(255, 0, 0);
  //rect(x, y-fontS, w, fontS);

  if (mouseX > x && mouseX < x + w && mouseY > y - fontS && mouseY < y) {
    println("inside ");
    fontS = int(random(30,60));
    textSize(fontS);
    x += random(-5, 5);
    y += random(-5, 5);
  } else {
    println("not inside");
  }
}