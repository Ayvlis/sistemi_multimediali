int x = 0;
float previousTime;
Triangle cucco;
PVector wind;

void setup() {
  size(1200, 800);
  wind = new PVector(5,0);
  previousTime = 0;
    
  PVector center = new PVector (100,height/2);
  PVector velocity = new PVector (0,0);
  
  cucco = new Triangle(center, velocity);
  previousTime = millis();
}

void draw() {
  float timeElapsed = millis()-previousTime;
  previousTime = millis();
  
  background(100, 100, 110);
  translate(cucco.center.x, cucco.center.y);
  rotate(radians(x));
 
  cucco.update(timeElapsed);
  cucco.display();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      x = x+10;
    } else if (keyCode == LEFT) {
      x = x-10;
    } 
  }
  if (key == 'z' ) {
      cucco.applyForce(wind);
  }
}