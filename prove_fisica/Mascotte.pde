class Mascotte {

  PVector position;
  float diameter;
  float r;
  color c; 
  PVector velocity;
  float mass;
  PVector acceleration;

  public Mascotte (PVector position, float d, color c, PVector vel) {
    this.position = position;
    this.diameter = d;
    this.r=d/2;
    this.c=c;
    this.velocity = vel;
    this.mass = this.diameter/10;
  }
  
  public void applyForce(PVector force) {
    this.acceleration = force.div(this.mass);
    this.velocity.add(this.acceleration);
  }
  
  public void checkBorders() {
    if(this.position.x >= width+r) {
      this.position.x=-r;  
    } else if(position.x <=-r) {
      this.position.x=(width+r);
    }
    if(this.position.y >= height+r) {
      this.position.y=-r;  
    } else if(this.position.y <=-r) {
      this.position.y=height+r;
    }
  }
  
  public void update() {
   this.position.add(this.velocity);
    this.display();
    this.checkBorders();
  }

  public void display() { 

    float newR = r/2;
    fill(c);
    pushMatrix();
    noStroke();
    translate(position.x, position.y);
    rotate(-PI/4);
    rectMode(CENTER);
    rect( newR, 0, newR, newR/3);
    translate(newR, 0);
    ellipse(diameter/5, 0, newR/1.5, newR/1.5);
    popMatrix();
    pushMatrix();
    noStroke();
    translate(position.x, position.y);
    line(0, -100, 0, 100);
    line(-100, 0, 100, 0);
    rotate(-3*PI/4);
    rect( newR*1.5, 0, newR, newR/3);
    translate(newR, 0);
    ellipse(diameter/5, 0, newR/1.5, newR/1.5);
    popMatrix();
    ellipse(position.x, position.y, r*20/19, r);
    fill(255);
    pushMatrix();
    translate(position.x +newR/2, position.y -newR/5);
    ellipse(0, 0, newR, newR);
    stroke(250, 255, 30, 200);
    strokeWeight(8);
    ellipse(0, 0, newR/1.2, newR/1.2);
    stroke(255, 255, 0, 80);
    strokeWeight(15);
    ellipse(0, 0, newR/1.2, newR/1.2);
    noStroke();
    fill(50, 50, 0);
    ellipse(0,-newR/20, newR/3, newR/3);
    popMatrix();
    pushMatrix();
    fill(255);
    translate(position.x -newR/2, position.y -newR/5);
    ellipse(0, 0, newR, newR);
    stroke(255, 255, 30, 200);
    strokeWeight(8);
    ellipse(0, 0, newR/1.2, newR/1.2);
    stroke(255, 255, 0, 80);
    strokeWeight(15);
    ellipse(0, 0, newR/1.2, newR/1.2);
    noStroke();
    fill(50, 50, 0);
    ellipse(0,-newR/20, newR/3, newR/3);
    popMatrix();    
  }
}