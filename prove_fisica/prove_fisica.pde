Mascotte mascotte;
Particle[] particles = new Particle[10];
PVector pos; 
float d;
color c;
PVector vel;
float dParticle;
PVector posParticle;
int counter = particles.length;

void setup() {
  size(1200, 700);
  pos = new PVector (width/2, height/2);
  d = 200;
  c = color(120,236,0);
  vel = new PVector(0,0);
  mascotte = new  Mascotte(pos, d, c, vel);
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
    if (mascotte.position.x<particles[i].position.x+particles[i].diameter/2 &&
        mascotte.position.x>particles[i].position.x-particles[i].diameter/2 &&
        mascotte.position.y<particles[i].position.y+particles[i].diameter/2 &&
        mascotte.position.y>particles[i].position.y-particles[i].diameter/2) {
          particles[i] = new Particle(0, new PVector(0,0));
          counter--;
        }
  }
  for(int i=0; i<particles.length; i++) {
    particles[i].display();
  }    
  mascotte.update();
  if (counter==0) {
    textAlign(CENTER, TOP);
    text("You Won", width/2, height/2);
    textAlign(CENTER, BOTTOM);
    text("Click anywhere to play again.", width/2, height);
    mascotte = new  Mascotte(new PVector(width/2, height/2-mascotte.diameter/3), mascotte.diameter, mascotte.c, new PVector(0,0));
  }
  }
  
void keyPressed() {
   if (key == CODED) {
    if (keyCode == RIGHT) {
      mascotte.applyForce(new PVector(10,0));
    } else if (keyCode == LEFT) {
      mascotte.applyForce(new PVector(-10,0));
    } else if (keyCode == UP) {
      mascotte.applyForce(new PVector(0,-10));
    } else if (keyCode == DOWN) {
      mascotte.applyForce(new PVector(0,10));
    } 
  } 
} 

void mousePressed() {
  if (counter==0) {
    for(int i=0; i<particles.length; i++) {
      posParticle = new PVector (random(width-dParticle/2), random(height-dParticle/2));
      dParticle = 50;
      particles[i] = new Particle(dParticle, posParticle);
    }
    counter = particles.length;
  }
}
    