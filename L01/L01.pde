int diam = 10;

void setup() {
  size(300,300);
}

void draw() {
  background(200)
  noFill();
  ellipse(random(width), random(height), random(100), random(100));
}