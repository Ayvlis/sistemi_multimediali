class Triangle {
  PVector center;  
  PVector velocity;
  PVector acceleration;
      
  
  public Triangle(PVector center, PVector velocity) {
    this.center = center;
    this.velocity = velocity;   
    this.acceleration = new PVector(0,0);
  }
  
     public void applyForce(PVector force) {
    PVector f  = PVector.div(force,1);
    acceleration.add(f);
  }
  
    public void update(float timeElapsed) {
    this.velocity = this.velocity.add(acceleration);
   //PVector target = p3.copy();
    //target.normalize();
    //target.mult(velocity.mag());
    //this.center = this.center.add(PVector.mult(target,timeElapsed/1000.0));
    this.center = this.center.add(PVector.mult(velocity,timeElapsed/1000.0));
    //this.position = position.add(speed);
    this.acceleration.mult(0);
  }
  
  public void display() {
  PVector p1 = new PVector(center.x-30, center.y +30);
  PVector p2 = new PVector(center.x-30, center.y -30);
  PVector p3 = new PVector(center.x+50, center.y );

    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y); 
  }
}