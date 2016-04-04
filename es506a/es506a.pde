boolean change = false;
int hue;
int saturation;
int brightness;
color c;

void setup() {
  size(1200,700);
  hue = (int)random(0,360);
}

void draw() {
  noStroke();
  colorMode(HSB, 360,100,100);
  rectMode(CENTER); 
  saturation = 60;
  brightness = 60;
  fill(hue, saturation, brightness);
  rect(width/2-200,height/2, 200, 200);
  brightness = 40;
  fill(hue, saturation, brightness);
  rect(width/2,height/2, 200, 200);
  brightness = 20;
  fill(hue, saturation, brightness);
  rect(width/2+200,height/2, 200, 200);
}

void mousePressed() {
  hue = (int)random(0,360);
}