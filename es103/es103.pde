  int X = 0;
  int Y = 0;

void setup() {
  size(300,300);
}

void draw() {
  X = width/2 -50;
  Y = height/2 -10;
  stroke(150);
  fill(150);
  rect(X, Y, 100, 40);
  rect(X+20, Y-30, 60, 30);
  fill(0);
  stroke(0);
  strokeWeight(3);
  line(X+20, Y, X+80, Y);
  fill(255);
  ellipse(X+25, Y+40, 30, 30);
  ellipse(X+75, Y+40, 30, 30);
}