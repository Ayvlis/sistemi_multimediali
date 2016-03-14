int X = 0;
int Y = 0;
int coordinateX[] = new int[20];
int coordinateY[] = new int[20];

void setup() {
  size(300,300);
  for (int i=0; i<20; i++ ) {
    coordinateX[i] = random(0, width);
    coordinateY[i] = random(0, height);
  }
}

void draw() {
  for(int i=0; i<20; i++) {
    background(200);
    stroke(150);
    fill(150);
    translate(coordinateX[i], coordinateY[i]);
    rect(0, 0, 100, 40);
    rect(20, -30, 60, 30);
    fill(0);
    stroke(0);
    strokeWeight(3);
    line(20, 0, 80, 0);
    fill(255);
    ellipse(25, 40, 30, 30);
    ellipse(75, 40, 30, 30);
  }
}