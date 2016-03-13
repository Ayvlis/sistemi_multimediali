class Particle {
  private PVector position;
  private double diameter;
  private PVector speed;
  private PVector acceleration;
  
  public Particle(PVector position, PVector speed, PVector acceleration, int d) {
    this.position = position;
    this.diameter = d;
    this.speed = speed;
    this.acceleration = acceleration;
  }
  
  public void display() {
    fill(156,255,0);
    ellipse(this.position.x, this.position.y, (float)this.diameter, (float)this.diameter);
  }
  
  public void update() {
    // speed2 = speed.mult(m/19.0);
    speed.add(acceleration);
    position.add(speed);
   
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