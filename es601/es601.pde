PImage softball;
color c;
float red;
float green;
float blue;


void setup() {
  softball = loadImage("softball.JPG"); 
  size(570, 860);
}

void draw() {
  background(0);
  image(softball, 0, 0, 570, 860);
  c = get(mouseX, mouseY);
  red = red(c);
  green = green(c);
  blue = blue(c);
  fill(red, 0, 0);
  rect(0, 0, 20, 50);
  fill(0, green, 0);
  rect(20, 0, 20, 50);
  fill(0, 0, blue);
  rect(40, 0, 20, 50);
}