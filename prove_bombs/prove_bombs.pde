Mascotte mascotte;
int numberOfParticles = 2;
int maxNumberOfParticles = 128;
Particle[] particles = new Particle[maxNumberOfParticles];
Bomb bomb;
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
PVector posBomb;
float dBomb;
int fuse;
int bombTimer;
int alfa = 150;


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
  posBomb = new PVector(int(random(dBomb, width-dBomb)), int(random(dBomb, height-dBomb)));
  dBomb = 150;
  fuse = int(random(5, 15));
  bomb = new Bomb(dBomb, posBomb, fuse);
  bombTimer = fuse*10;
}

void draw() {
  background(60);
  if (counter==0) {
    fill(220);
    textAlign(CENTER, TOP);
    text("You Won", width/2, height/2);
    textAlign(CENTER, BOTTOM);
    text("Click anywhere to start next level.", width/2, height);
    mascotte = new  Mascotte(new PVector(width/2, height/2-mascotte.diameter/3), mascotte.diameter, mascotte.c, new PVector(0, 0));
  } else {
    if (bombTimer==0) { 
      if (mascotte.position.x<bomb.position.x+bomb.explosionArea &&
        mascotte.position.x>bomb.position.x-bomb.explosionArea &&
        mascotte.position.y<bomb.position.y+bomb.explosionArea &&
        mascotte.position.y>bomb.position.y-bomb.explosionArea) {
          text("you lost", width/2, height/2);
        }
      alfa-=2;
      if (alfa==0) {
        posBomb = new PVector(int(random(dBomb, width-dBomb)), int(random(dBomb, height-dBomb)));
        fuse = int(random(5, 15));
        bomb = new Bomb(dBomb, posBomb, fuse);
        bombTimer = fuse*10;
        alfa = 150;
      }
    } else {
      bombTimer--;
      bomb.fuse=int(bombTimer/10);
    }
    bomb.display();
    textSize(32);
    fill(160);
    textAlign(LEFT, RIGHT);
    text(counter, 20, 30);
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
      randomBlink = int(random(100, 200));
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

  mascotte.update(eyesMoving);
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