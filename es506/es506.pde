void setup() {
  size(600,600);
}

void draw() {
  noStroke();
  colorMode(HSB, 360,100,100);
  float x = map(mouseX, 0, width, 0, 360);
  float y = map(mouseY, 0, height, 0, 360);
  background(y, 50, 50);
  fill((y+180)%360, 50, 50);
  rectMode(CENTER);
  rect(width/2,height/2, mouseX+1, mouseX+1); 
}