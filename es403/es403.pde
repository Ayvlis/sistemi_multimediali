//int X = 0;
int Y;
int coordinateX[] = new int[20];
int coordinateY[] = new int[20];

void setup() {
  size(800, 500);
  Y = height/2;
}

void draw() {

  background(200);
  for (int i=0; i<8; i++) {
    stroke(150);
    rect(0, Y, 100, 40);
    rect(20, Y-30, 60, 30);
    fill(0);
    stroke(0);
    strokeWeight(3);
    line(20, Y, 80, Y);
    fill(255);
    ellipse(25, Y+40, 30, 30);
    ellipse(75, Y+40, 30, 30);
    fill(100);
    translate(width/8, 0);
  }
}