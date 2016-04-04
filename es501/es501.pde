void setup() {
  size(1200,700);
}

void draw() {
  rectMode(CENTER);
  noStroke();
  float grey;
  if(mouseX<width/2) {
   grey = map(mouseX, 0, width/2, 100, 211);
  } else {
   grey = map(mouseX, width/2, width, 211, 223);
  }
  System.out.println(grey);
  fill((int)grey);
  rect(width/2, height/2, 200,200);
  fill(211);
  ellipse( width/2, height/2, 100, 100);
}