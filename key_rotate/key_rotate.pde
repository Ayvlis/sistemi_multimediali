int x = 0;
Triangle cucco;
float previousTime;

void setup() {
  size(1200, 800);
  PVector position = new PVector(0,0);
  PVector velocity = new PVector(0,0); 
  previousTime = 0;
  cucco = new Triangle(position, velocity);
}

void draw() {
  background(100, 100, 110);
  translate(cucco.center.x, cucco.center.y);
  rotate(radians(x));  
  line(-200,0, 200,0);
  line(0,-200, 0,200);
  cucco.display();
  

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