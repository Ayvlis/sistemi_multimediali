int x = 0;
float previousTime;
Triangle cucco;
PVector wind;

void setup() {
  size(1200, 800);
  wind = new PVector(5,0);
  previousTime = 0;
    
  PVector velocity = new PVector (0,0);
  PVector position = new PVector (0,0);
  
  translate(100, height/2);
  
  cucco = new Triangle(position, velocity);
  previousTime = millis();
  
  
}

void draw() {
  float timeElapsed = millis()-previousTime;
  previousTime = millis();
  
 // background(100, 100, 110);
  translate(cucco.center.x, cucco.center.y);
  line(-200,0, 200,0);
  line(0,-200, 0,200);
 
  cucco.update(timeElapsed);
  cucco.display();
}

void keyPressed() {
  if (key == 'z' ) {
      cucco.applyForce(wind);
  }
}