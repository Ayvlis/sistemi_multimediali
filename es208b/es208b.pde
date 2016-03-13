final int numberOfParticles = 200;
Particle[] particles = new Particle[numberOfParticles];
PVector vPos;
PVector vSpd;
PVector vAcc;

void setup() {
  size(1200, 800);
 for (int i=0; i<particles.length; i++) {
   vPos = new PVector(width/2, height/2);
   vAcc = new PVector(0,0.2);
   vSpd = new PVector(random(-5,4), random(5,-2));
   particles[i] = new Particle(vPos, vSpd, vAcc, int(random(40)));
 }
}

void draw() {
 background(35,35,35);
 for (int i=0; i<particles.length; i++) {
   particles[i].bounce();
   particles[i].update();
   particles[i].display();

 }
}