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
boolean eyesMoving = false;
int eyesMovingLifeTime = 30;
int randomBlink = int(random(100, 200));
int randomBlinkCounter = 0;
boolean blinking = false;
int blinkLifeTime = 10;
boolean eating = false;
int eatLifeTime = 15;


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
  background(100);
  if (counter==0) {
    fill(0);
    textAlign(CENTER, TOP);
    text("You Won", width/2, height/2);
    textAlign(CENTER, BOTTOM);
    text("Click anywhere to start next level.", width/2, height);
    mascotte = new  Mascotte(new PVector(width/2, height/2-mascotte.diameter/3), mascotte.diameter, mascotte.c, new PVector(0, 0));
  } else {
    textSize(32);
    fill(0);
    text(counter, 40, 40);
    textAlign(RIGHT, BOTTOM);
    text("level "+level, width, 40);
    for (int i=0; i<numberOfParticles; i++) {
      if (mascotte.position.x<particles[i].position.x+particles[i].diameter/2 &&
        mascotte.position.x>particles[i].position.x-particles[i].diameter/2 &&
        mascotte.position.y<particles[i].position.y+particles[i].diameter/2 &&
        mascotte.position.y>particles[i].position.y-particles[i].diameter/2) {
        eating = true;
        particles[i] = new Particle(0, new PVector(0, 0));
        counter--;
      }
    }
    for (int i=0; i<numberOfParticles; i++) {
      particles[i].display();
    }
  }
  mascotte.update(eyesMoving);

  if (eyesMoving) {    
    eyesMovingLifeTime--;
    if (eyesMovingLifeTime == 0) {
      eyesMoving = false;
      eyesMovingLifeTime=30;
    }
  }
  
  if (blinking) {    
    blinkLifeTime--;
    if (blinkLifeTime == 0) {
      blinking = false;
      blinkLifeTime=10;
    }
  } else {
    randomBlinkCounter++;
    if (randomBlinkCounter == randomBlink) {
      blinking = true;
      randomBlink = int(random(100,200));
      randomBlinkCounter = 0;
    }
  }
  if (eating) {    
   eatLifeTime--;
    if (eatLifeTime == 0) {
      eating = false;
      eatLifeTime=15;
    }
  }
}


void keyPressed() {
  if (key == CODED) {
    eyesMoving = true;
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