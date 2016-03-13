class Particle {
  private PVector position;
  private double diameter;
  private PVector speed;
  private PVector acceleration;
  
  public Particle(PVector position, PVector speed, PVector acceleration) {
    this.position = position;
    this.diameter = 50;
    this.speed = speed;
    this.acceleration = acceleration;
  }
  
  public void display() {
    fill(156,255,0);
    ellipse(this.position.x, this.position.y, (float)this.diameter, (float)this.diameter);
  }
  
  public void update() {
    // speed2 = speed.mult(m/19.0);
    PVector mouse = new PVector(mouseX, mouseY);

      this.acceleration = mouse.sub(position);
      acceleration.normalize();
      this.acceleration = acceleration.mult(0.5);
      this.speed = speed.add(acceleration).limit(4);
      this.position = position.add(speed);
    
   
  }
  
  public void bounce() {
    double r = diameter/2;
    if (this.position.y > height-r || this.position.y < r) {
      speed.y = speed.y*(-1);
    } else if (this.position.x > width-r || this. position.x < r) {
      speed.x = speed.x*(-1);
    }
  }
}