import geomerative.*;
float x1, x2, y1, y2;
int gridSize = 15;
int gridSpacingX, gridSpacingY;
int canvasWidth = 2400;
int canvasHeight = 800;
int nextIndex = 0;

RFont f;
RShape grp;
RPoint[] points;

//change this to true if you'd want to see automatic sketching, false for manual use with keystrokes
boolean automode = true;

void setup() {
  size(2400, 800);
  background(255);
  gridSpacingX = canvasWidth / gridSize;
  gridSpacingY = canvasHeight / gridSize;
  RG.init(this);

  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("CREATIVE CODING", "FreeSans.ttf", 100, CENTER);
}

void draw() {


  pushMatrix();
  translate(width/2, height/2);
  RG.setPolygonizer(RG.ADAPTATIVE);
  //grp.draw();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(12);
  points = grp.getPoints();

  if (automode) {
    if (nextIndex < points.length)
    {
      //background(255);
      callNext();
      if (nextIndex%5==0) {
        stroke(0);
        line(x1, y1, x2, y2);
      }
      //strokeWeight(0.1);
      fill(0);
      noStroke();
      ellipse(x2, y2, 6, 6);
    }
  } else {
    if (nextIndex < points.length)
    {
      background(255);
      if (nextIndex%5==0) {
        stroke(0);
        strokeWeight(0.3);
        line(x1, y1, x2, y2);
      }

      fill(0);
      noStroke();
      ellipse(x2, y2, 6, 6);
    }
  }


  popMatrix();
}

void mouseReleased() {

  x1 = (-5+int(random(10)))* gridSpacingX;
  x2 = points[nextIndex].x;

  if (nextIndex%2==0) {
    y1 = height*0.2;
  }else{
    y1 = -1*height*0.2;
  }
  y2 = points[nextIndex].y;
  nextIndex ++;
  //nextIndex = nextIndex % points.length;
}

void callNext() {
  x1 = (-5+int(random(10)))* gridSpacingX;
  x2 = points[nextIndex].x;
  if (nextIndex%2==0) {
    y1 = height*0.2;
  }else{
    y1 = -1*height*0.2;
  }
 
  y2 = points[nextIndex].y;

  nextIndex ++;
  //nextIndex = nextIndex % points.length;
}

void keyPressed(){
  
  x1 = (-5+int(random(10)))* gridSpacingX;
  x2 = points[nextIndex].x;

  if (nextIndex%2==0) {
    y1 = height*0.2;
  }else{
    y1 = -1*height*0.2;
  }
  y2 = points[nextIndex].y;

  nextIndex ++;
  //nextIndex = nextIndex % points.length;
  
}