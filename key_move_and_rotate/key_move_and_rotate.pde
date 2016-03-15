int rotation = 0;
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
  rotate(radians(rotation));
  translate(cucco.center.x, cucco.center.y);
 
  cucco.update(timeElapsed);
  cucco.display();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      rotation += 1;
    } else if (keyCode == LEFT) {
      rotation -= 1;
    } 
  }
  if (key == 'z' ) {
      cucco.applyForce(wind);
  }
}