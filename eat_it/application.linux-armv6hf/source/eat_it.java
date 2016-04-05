import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class eat_it extends PApplet {

Mascotte mascotte;
int numberOfParticles = 2;
int maxNumberOfParticles = 128;
Particle[] particles = new Particle[maxNumberOfParticles];
PVector pos; 
float d;
int c;
PVector vel;
float dParticle;
PVector posParticle;
int counter = numberOfParticles;
int level = 1;
boolean eyesMoving = false;
int eyesMovingLifeTime = 30;
int randomBlink = PApplet.parseInt(random(100, 200));
int randomBlinkCounter = 0;
boolean blinking = false;
int blinkLifeTime = 10;
boolean eating = false;
int eatLifeTime = 15;


public void setup() {
  
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

public void draw() {
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
      randomBlink = PApplet.parseInt(random(100,200));
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


public void keyPressed() {
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

public void mousePressed() {
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
class Mascotte {

  PVector position;
  float diameter;
  float r;
  int c; 
  PVector velocity;
  float mass;
  PVector acceleration;

  public Mascotte (PVector position, float d, int c, PVector vel) {
    this.position = position;
    this.diameter = d;
    this.r=d/2;
    this.c=c;
    this.velocity = vel;
    this.mass = this.diameter/10;
  }

  public void rotateObject(float degrees) {
    float radians = radians(degrees);
    rotate(radians);
  }

  public void applyForce(PVector force) {
    PVector temp = this.velocity.copy();
    this.acceleration = force.div(this.mass); 
    this.velocity.add(acceleration);
    if (this.velocity.x>10 || this.velocity.y>10 || this.velocity.x<-10 || this.velocity.y<-10) {
      this.velocity = temp;
    }
  }

  public void bounce() {
    if (this.position.x >= width-r/2 || position.x <=r/2) {
      this.velocity.x*=(-1);
    }
    if (this.position.y >= height-r/2 || this.position.y <=r/2) {
      this.velocity.y*=(-1);
    }
  }

  public void checkBorders() {
    if (this.position.x >= width+r) {
      this.position.x=-r;
    } else if (position.x <=-r) {
      this.position.x=(width+r);
    }
    if (this.position.y >= height+r) {
      this.position.y=-r;
    } else if (this.position.y <=-r) {
      this.position.y=height+r;
    }
  }

  public void update(boolean bool) {
    this.position.add(this.velocity);
    this.display(bool);
    // this.bounce();
    this.checkBorders();
  }

  public void display(boolean bool) { 

    float newR = r/2;
    fill(c);
    pushMatrix();
    noStroke();
    translate(position.x, position.y);
    rotate(-PI/4);
    rectMode(CENTER);
    rect( newR, 0, newR, newR/3);
    translate(newR, 0);
    ellipse(diameter/5, 0, newR/1.5f, newR/1.5f);
    popMatrix();
    pushMatrix();
    noStroke();
    translate(position.x, position.y);
    line(0, -100, 0, 100);
    line(-100, 0, 100, 0);
    rotate(-3*PI/4);
    rect( newR*1.5f, 0, newR, newR/3);
    translate(newR, 0);
    ellipse(diameter/5, 0, newR/1.5f, newR/1.5f);
    popMatrix();
    ellipse(position.x, position.y, r*20/19, r);
    fill(255);
    if (blinking) {
      pushMatrix();
      translate(position.x +newR/2, position.y -newR/5);
      fill(0);
      rect(0, 0, newR/2, newR/9);
      popMatrix();
      pushMatrix();
      translate(position.x -newR/2, position.y -newR/5);
      rect(0, 0, newR/2, newR/9);
      popMatrix();
    } else {
      pushMatrix();
      translate(position.x +newR/2, position.y -newR/5);
      ellipse(0, 0, newR, newR);
      stroke(250, 255, 30, 200);
      strokeWeight(8);
      ellipse(0, 0, newR/1.2f, newR/1.2f);
      stroke(255, 255, 0, 80);
      strokeWeight(15);
      ellipse(0, 0, newR/1.2f, newR/1.2f);
      noStroke();
      fill(50, 50, 0);
      pushMatrix();
      translate(0, -newR/20);
      if (bool && this.acceleration != new PVector (0, 0) && counter != 0 ) {
        float b = atan2(this.acceleration.y, this.acceleration.x );
        rotate(b);
        ellipse(10, 0, newR/3, newR/3);
      } else {
        ellipse(0, 0, newR/3, newR/3);
      }
      popMatrix();
      // ellipse(0, -newR/20, newR/3, newR/3);
      popMatrix();
      pushMatrix();
      fill(255);
      translate(position.x -newR/2, position.y -newR/5);
      ellipse(0, 0, newR, newR);
      stroke(255, 255, 30, 200);
      strokeWeight(8);
      ellipse(0, 0, newR/1.2f, newR/1.2f);
      stroke(255, 255, 0, 80);
      strokeWeight(15);
      ellipse(0, 0, newR/1.2f, newR/1.2f);
      noStroke();
      fill(50, 50, 0);
      pushMatrix();
      translate(0, -newR/20);
      if (bool && this.acceleration != new PVector (0, 0) && counter != 0 ) {
        float b = atan2(this.acceleration.y, this.acceleration.x );
        rotate(b);
        ellipse(10, 0, newR/3, newR/3);
      } else {
        ellipse(0, 0, newR/3, newR/3);
      }
      popMatrix();
      //ellipse(0, -newR/20, newR/3, newR/3);
      popMatrix();
    }
    if(eating && counter!=0) {  
      pushMatrix();
      translate(position.x, position.y +newR/1.9f);
      ellipse(0,0, newR/1.5f, newR/1.2f);
      popMatrix();      
      noFill();
    }
  }
}
class Particle {
  float diameter;
  PVector position;
  
  public Particle (float d, PVector pos) {
    this.diameter = d;
    this.position = pos;
  }
  
  public void display() {
    float r = this.diameter/2;
    fill(255);
    ellipse(position.x, position.y, r, r);
  }
  
}
    
  public void settings() {  size(1200, 525); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "eat_it" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
