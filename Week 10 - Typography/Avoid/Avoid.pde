//Original copy @ Processing: a programmin handbook for visual designers and artists
//Casey Reas
//Ben Fry
//Code forked by Selcuk ARTUT
//Course material for VA345 Creative Coding @ Sabanci University 2017

void setup() {
  size(1000, 1000);
  textAlign(CENTER);
  textSize(32);
  fill(0);
}
void draw() {
  background(204);
  text("avoid", width-mouseX, height-mouseY);
}