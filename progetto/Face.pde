class Face {

  PVector position;
  float diameter;
  float r;
  float r_1;
  color c; 
  PVector velocity;
  float mass;
  PVector acceleration;
  
  public Face() {  
  this(new PVector(width/4,height/2), 200, color(360,32,68), new PVector(0,0));
  }

  public Face (PVector position, float d, color c, PVector vel) {
    this.position = position;
    this.diameter = d;
    this.r=d/2;
    this.c=c;
    this.velocity = vel;
    this.r_1 = r*20/19;
    this.mass = this.diameter*this.r_1/200;
    this.acceleration = new PVector(0,0);
    
  }
  
  public void setPosition(PVector position) {
    this.position = position;
  }
    
  
  public void setMass(float newDiameter) {
    this.diameter = newDiameter;
    this.r_1=this.diameter/2;
    this.mass = this.diameter*this.r_1/800;
    
  }
  
  public float getDiameter() {
    return this.diameter;
  }
  
  public void rotateObject(float degrees) {
    float radians = radians(degrees);
    rotate(radians);
  }

  public void applyForce(PVector force) {
    PVector temp = this.velocity.copy();
    temp = temp.mult(200/diameter);
    this.acceleration = force.div(this.mass); 
    this.velocity.add(acceleration);
    if (this.velocity.x>5000/diameter ||
        this.velocity.y>5000/diameter ||
        this.velocity.x<(-1)*5000/diameter ||
        this.velocity.y<(-1)*5000/diameter) {
          velocity = temp;
    }
    
    println(velocity);
    
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

  public void update(boolean blink, boolean eyes, boolean mouth) {
    this.position.add(this.velocity);
    this.display(blink, eyes, mouth);
    // this.bounce();
    this.checkBorders();
  }

  public void display(boolean blink, boolean eyes, boolean mouth) { 

    float newR = r/2;
    fill(358,38,90);
    noStroke();
    rectMode(CENTER);
    /*translate(position.x, position.y);
    rotate(-PI/4); 
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
    ellipse(diameter/5, 0, newR/1.5, newR/1.5); */
    ellipse(position.x, position.y, r_1, r);
    fill(0,0,100);
    if (blink) {
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
      /*stroke(250, 255, 30, 200);
      strokeWeight(8);
      ellipse(0, 0, newR/1.2, newR/1.2);
      stroke(255, 255, 0, 80);
      strokeWeight(15);
      ellipse(0, 0, newR/1.2, newR/1.2);
      noStroke();*/
      fill(0, 0, 0);
      pushMatrix();
      translate(0, -newR/20);
      if (eyes && this.acceleration != new PVector (0, 0) /*&& counter != 0*/ ) {
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
      fill(0,0,100);
      translate(position.x -newR/2, position.y -newR/5);
      ellipse(0, 0, newR, newR);
      /*stroke(255, 255, 30, 200);
      strokeWeight(8);
      ellipse(0, 0, newR/1.2, newR/1.2);
      stroke(255, 255, 0, 80);*/
      strokeWeight(15);
      ellipse(0, 0, newR/1.2, newR/1.2);
      noStroke();
      fill(0, 0, 0);
      pushMatrix();
      translate(0, -newR/20);
      if (eyes && this.acceleration != new PVector (0, 0) /*&& counter != 0*/ ) {
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
    if(mouth /*&& counter!=0*/ ) {  
      pushMatrix();
      translate(position.x, position.y +newR/1.9);
      ellipse(0,0, newR/1.5, newR/1.2);
      popMatrix();      
      noFill();
    }
  }
}