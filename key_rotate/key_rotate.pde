int x = 0;

void setup() {
  size(1200, 800);
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(x));
  rectMode(CENTER);
  rect(0, 0, 50, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      x = x+10;
    } else if (keyCode == DOWN) {
      x = x-10;
    } 
  }
}