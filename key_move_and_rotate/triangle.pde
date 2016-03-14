class Triangle {
  PVector center;  
  PVector velocity;
  PVector acceleration;
  PVector p1 = new PVector(-30, 30);
  PVector p2 = new PVector(-30,-30);
  PVector p3 = new PVector(50, 0 );
  
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
    PVector target = p3.copy();
    target.normalize();
    target.mult(acceleration.mag());
    this.velocity = this.velocity.add(target);
    this.center = this.center.add(PVector.mult(velocity,timeElapsed/1000.0));
    //this.position = position.add(speed);
    this.acceleration.mult(0);
  }
  
  public void display() {
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y); 
  }
}