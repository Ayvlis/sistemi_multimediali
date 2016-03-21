int rotation = 0;
float previousTime;
Triangle cucco;
PVector engine = new PVector(5,0);

void setup() {
  size(1200, 800);
  previousTime = 0;
    
  PVector center = new PVector (100,0);
  PVector velocity = new PVector (0,0);
  
  cucco = new Triangle(center, velocity);
  previousTime = millis();
}

void draw() {
  float timeElapsed = millis()-previousTime;
  previousTime = millis();
  
  background(100, 100, 110);
  pushMatrix();
  translate(100,0);
  rotate(radians(rotation));
  popMatrix();
  line(-200,0, 200,0);
  line(0,-200, 0,200);
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
      cucco.applyForce(engine);
  }
}