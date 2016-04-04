boolean white = false;

void setup() {
  size(200,800);
}

void draw() {
  rectMode(CENTER);
  noStroke();
  if(white) {
    fill(255);
    rect(width/2, height/2-height/6, width/3, height/3);
    rect(width/2, height/2+height/6, width/3, height/3);
  } else {
    fill(73,29,52);
    rect(width/2, height/2-height/6, width/3, height/3);
    fill(61,35,20);
    rect(width/2, height/2+height/6, width/3, height/3);
  }
  fill(67,33,34);
  rect( width/2, height/2-height/6, height/12, height/12);
  rect( width/2, height/2+height/6, height/12, height/12);
}

void mousePressed() {
  white=!white;
}