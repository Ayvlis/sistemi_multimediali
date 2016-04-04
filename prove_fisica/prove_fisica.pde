Mascotte stivs;

void setup() {
  size(1200, 525);
  PVector pos = new PVector (width/2, height/2);
  float d = 200;
  color c = color(120,236,0);
  PVector vel = new PVector(0,0);
  stivs = new  Mascotte(pos, d, c, vel);
  stivs.display();
}

void draw() {
  background(200);
  stivs.update();
  
}
  
void keyPressed() {
   if (key == CODED) {
    if (keyCode == RIGHT) {
      stivs.applyForce(new PVector(10,0));
    } else if (keyCode == LEFT) {
      stivs.applyForce(new PVector(-10,0));
    } else if (keyCode == UP) {
      stivs.applyForce(new PVector(0,-10));
    } else if (keyCode == DOWN) {
      stivs.applyForce(new PVector(0,10));
    } 
  }
}