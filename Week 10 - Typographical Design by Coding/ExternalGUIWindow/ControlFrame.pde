class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
       
    cp5.addSlider("angle")
       .plugTo(parent, "angle")
       .setRange(0, 90)
       .setValue(0)
       .setPosition(10, 10)
       .setSize(200, 30);
       
  }

  void draw() {
    background(190);
  }
}