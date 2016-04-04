boolean change = false;
int hue1;
int hue2;
int hue3;
int saturation;
int brightness;
color c;

void setup() {
  size(1200,700);
  hue1 = (int)random(0,360);
}

void draw() {
  hue2 = hue1+50;
  hue3 = hue1-50;
  noStroke();
  colorMode(HSB, 360,100,100);
  rectMode(CENTER); 
  saturation = 60;
  brightness = 60;
  fill(hue2, saturation, brightness);
  rect(width/2-200,height/2, 200, 200);
  fill(hue1, saturation, brightness);
  rect(width/2,height/2, 200, 200);
  fill(hue3, saturation, brightness);
  rect(width/2+200,height/2, 200, 200);
}

void mousePressed() {
  hue1 = (int)random(0,360);
}