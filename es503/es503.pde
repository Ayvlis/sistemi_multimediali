boolean white = false;

void setup() {
  size(1200,700);
}

void draw() {
  rectMode(CENTER);
  noStroke();
  if(white) {
    fill(255);
    rect(width/2-width/4, height/2, width/2, height);
  } else {
    fill(0);
    rect(width/2-width/4, height/2, width/2, height);
    fill(255);
    rect(width/2+width/4, height/2, width/2, height);
  }
  fill(38);
  rect( width/2-width/4, height/2, width/16, height/8);
  fill(143);
  rect( width/2+width/4, height/2, width/16, height/8);
}

void mousePressed() {
  white=!white;
}