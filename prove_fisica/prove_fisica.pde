Mascotte stivs;
Particle[] particles = new Particle[10];
PVector pos; 
float d;
color c;
PVector vel;
float dParticle;
PVector posParticle;
int counter = particles.length;

void setup() {
  size(1200, 525);
  pos = new PVector (width/2, height/2);
  d = 200;
  c = color(120,236,0);
  vel = new PVector(0,0);
  stivs = new  Mascotte(pos, d, c, vel);
  for(int i=0; i<particles.length; i++) {
    posParticle = new PVector (random(width-dParticle/2), random(height-dParticle/2));
    dParticle = 50;
    particles[i] = new Particle(dParticle, posParticle);
  }  
}

void draw() {
  background(200);
  textSize(32);
  text(counter, 10, 30); 
  for(int i=0; i<particles.length; i++) {
    if (stivs.position.x<particles[i].position.x+particles[i].diameter/2 &&
        stivs.position.x>particles[i].position.x-particles[i].diameter/2 &&
        stivs.position.y<particles[i].position.y+particles[i].diameter/2 &&
        stivs.position.y>particles[i].position.y-particles[i].diameter/2) {
          particles[i] = new Particle(0, new PVector(0,0));
          counter--;
        }
  }
  for(int i=0; i<particles.length; i++) {
    particles[i].display();
  }    
  stivs.update();
  if (counter==0) {
    textAlign(CENTER, CENTER);
    text("You Won", width/2, height/2);
    stivs = new  Mascotte(new PVector(width/2, height/2-stivs.diameter/3), stivs.diameter, stivs.c, new PVector(0,0));
  }
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