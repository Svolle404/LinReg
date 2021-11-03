// Klik et sted i koordinatsystemet for at lave et punkt
// Tryk på mellemrum for at fjerne alle punkter

final int gitterBredde = 50;

IntList xKoordinater = new IntList();
IntList yKoordinater = new IntList();

float sumX = 0;
float sumY = 0;
float sumXY = 0;
float sumXX = 0;
float sumYY = 0;

float a = 0;
float b = 0;
float r = 0;

void setup() {
  size(1500, 1000);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  strokeWeight(1);
  stroke(200);
  fill(0);
  textSize(12);
  textAlign(CENTER, TOP);
  for (int i = 0; i < width/gitterBredde; i++) {
    line(-width/2+i*gitterBredde, -height/2, -width/2+i*gitterBredde, height/2);
    if (-width/2+i*gitterBredde != 0) {
      text(-width/2+i*gitterBredde, -width/2+i*gitterBredde, 10);
    }
  }

  textAlign(RIGHT, CENTER);
  for (int i = 0; i < height/gitterBredde; i++) {
    line(-width/2, -height/2+i*gitterBredde, width/2, -height/2+i*gitterBredde);
    if (-height/2+i*gitterBredde != 0) {
      text((-height/2+i*gitterBredde)*(-1), -10, -height/2+i*gitterBredde);
    }
  }

  stroke(30);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);

  stroke(0, 150, 255);
  strokeWeight(10);
  for (int i = 0; i < xKoordinater.size(); i++) {
    point(xKoordinater.get(i), yKoordinater.get(i)*(-1));
  }

  if (xKoordinater.size() >= 2) {
    sumX = 0;
    sumY = 0;
    sumXY = 0;
    sumXX = 0;
    sumYY = 0;
    int n = xKoordinater.size();

    for (int i = 0; i < xKoordinater.size(); i++) {
      sumX += xKoordinater.get(i);
    }

    for (int i = 0; i < yKoordinater.size(); i++) {
      sumY += yKoordinater.get(i);
    }

    for (int i = 0; i < xKoordinater.size(); i++) {
      sumXY += xKoordinater.get(i)*yKoordinater.get(i);
    }

    for (int i = 0; i < xKoordinater.size(); i++) {
      sumXX += xKoordinater.get(i)*xKoordinater.get(i);
    }

    for (int i = 0; i < yKoordinater.size(); i++) {
      sumYY += yKoordinater.get(i)*yKoordinater.get(i);
    }

    a = (n*sumXY-sumX*sumY)/(n*sumXX-sumX*sumX);
    b = ((sumY*sumXX-sumX*sumXY)/(n*sumXX-sumX*sumX))*(-1);
    r = (n*sumXY-sumX*sumY)/sqrt((n*sumXX-sumX*sumX)*(n*sumYY-sumY*sumY));

    stroke(255, 0, 0);
    strokeWeight(2);
    line(-width/2, width/2*a+b, width/2, -width/2*a+b);

    textSize(20);
    textAlign(LEFT, TOP);
    fill(0);
    text("> a: "+a, -width/2, -height/2);
    text("> b: "+b*(-1), -width/2, -height/2+20);
    text("> r: "+r, -width/2, -height/2+40);
  }
}

void mousePressed() {
  xKoordinater.append(mouseX-width/2);
  yKoordinater.append((mouseY-height/2)*(-1));
}

void keyPressed() {
  if (key == ' ') {
    xKoordinater.clear();
    yKoordinater.clear();
  }
}
