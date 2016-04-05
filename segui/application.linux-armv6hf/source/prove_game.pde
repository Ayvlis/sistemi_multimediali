Mascotte mascotte;
int numberOfParticles = 2;
int maxNumberOfParticles = 128;
Particle[] particles = new Particle[maxNumberOfParticles];
PVector pos; 
float d;
color c;
PVector vel;
float dParticle;
PVector posParticle;
int counter = numberOfParticles;
int level = 1;

void setup() {
  size(1200, 525);
  pos = new PVector (width/2, height/2);
  d = 200;
  c = color(120, 236, 0);
  vel = new PVector(0, 0);
  mascotte = new  Mascotte(pos, d, c, vel);
  for (int i=0; i<numberOfParticles; i++) {
    posParticle = new PVector (random(width-dParticle/2), random(height-dParticle/2));
    dParticle = 50;
    particles[i] = new Particle(dParticle, posParticle);
  }
}

void draw() {
  background(200);
  if (counter==0) {
    textAlign(CENTER, TOP);
    text("You Won", width/2, height/2);
    textAlign(CENTER, BOTTOM);
    text("Click anywhere to start next level.", width/2, height);
    mascotte = new  Mascotte(new PVector(width/2, height/2-mascotte.diameter/3), mascotte.diameter, mascotte.c, new PVector(0, 0));
  } else {
    textSize(32);
    text(counter, 40, 40);
    textAlign(RIGHT, BOTTOM);
    text("level "+level, width, 40);
    for (int i=0; i<numberOfParticles; i++) {
      if (mascotte.position.x<particles[i].position.x+particles[i].diameter/2 &&
        mascotte.position.x>particles[i].position.x-particles[i].diameter/2 &&
        mascotte.position.y<particles[i].position.y+particles[i].diameter/2 &&
        mascotte.position.y>particles[i].position.y-particles[i].diameter/2) {
        particles[i] = new Particle(0, new PVector(0, 0));
        counter--;
      }
    }
    for (int i=0; i<numberOfParticles; i++) {
      particles[i].display();
    }
  }
  mascotte.update();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      mascotte.applyForce(new PVector(10, 0));
    } else if (keyCode == LEFT) {
      mascotte.applyForce(new PVector(-10, 0));
    } else if (keyCode == UP) {
      mascotte.applyForce(new PVector(0, -10));
    } else if (keyCode == DOWN) {
      mascotte.applyForce(new PVector(0, 10));
    }
  }
} 

void mousePressed() {
  if (counter==0) {
    numberOfParticles*=2;
    numberOfParticles = min(maxNumberOfParticles, numberOfParticles);
    for (int i=0; i<numberOfParticles; i++) {
      posParticle = new PVector (random(width-dParticle/2), random(height-dParticle/2));
      dParticle = 50;
      particles[i] = new Particle(dParticle, posParticle);
    }
    counter = numberOfParticles;
    level++;
  }
}