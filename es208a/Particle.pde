class Particle {
  private PVector position;
  private int diameter;
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
    this.speed = speed.add(acceleration);
    this.position = position.add(speed);
   
  }
  
    public void border() {
    if (this.position.x > width || this.position.y > height) {
      this.position.x = 0;
    };
    if (this.position.x < 0) {
      this.position.x = width;
    }; 
    if (this.position.y < 0) {
      this.position.y = height;
    };
  }
  
  public void bounce() {
    float r = diameter/2.0;
    if (this.position.y > height-r || this.position.y < r) {
      speed.y = speed.y*(-1);
    } else if (this.position.x > width-r || this. position.x < r) {
      speed.x = speed.x*(-1);
    }
  }
  
  public void center() {
   float r = diameter/2.0;
   if (this.position.y > height-r || this.position.y < r || this.position.x > width-r || this. position.x < r)  {
     position = new PVector(width/2, height/2);
     speed = new PVector(random(-5,4), random(5,2));
   }
  }
}