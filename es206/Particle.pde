class Particle {
  private PVector position;
  private int diameter;
  private PVector speed;
  private PVector acceleration;
  
  public Particle(PVector position, PVector speed, PVector acceleration) {
    this.position = position;
    this.diameter = 10;
    this.speed = speed;
    this.acceleration = acceleration;
  }
  
  public void display() {
    ellipse(this.position.x, this.position.y, this.diameter, this.diameter);
  }
  
  public void update() {
    // speed2 = speed.mult(m/19.0);
    this.acceleration = new PVector(random(-1,1), random(-1,1));
    acceleration.normalize();
    this.acceleration = acceleration.mult(0.3);
    this.speed = speed.add(acceleration);
    println(this.speed);
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
    if (this.position.y > height || this.position.x > width|| this.position.y < 0 || this. position.x < 0) {
      this.speed = speed.mult(-1);
      ;
    };
  }
}