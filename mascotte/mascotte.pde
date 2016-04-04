Particle particle;

void setup() {
  size(1200, 525);
  PVector pos = new PVector (width/2, height/2);
  float d = 200;
  color c = color(120,236,0);
  particle = new Particle(pos, d, c);
  particle.display();
}

void draw() {
  
}
  