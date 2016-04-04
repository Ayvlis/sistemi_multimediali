boolean white = false;

void setup() {
  size(360,200);
}

void draw() {
  noStroke();
  colorMode(HSB, 360,100,100);
  for(int i=0; i<360; i++){
    float x = map(mouseX, 0, width, 100, 0);
    float y = map(mouseY, 0, height, 100, 0);
    fill(i, x, y);
    rect(i, 0, 1, height); 
  }
}