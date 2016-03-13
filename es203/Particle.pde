class Particle {
  private PVector position;
  private int diameter;
  private PVector speed;
  private PVector speed2;
  
  public Particle(PVector position, PVector speed) {
    this.position = position;
    this.diameter = 10;
    this.speed = speed;
  }
  
  public void display() {
    ellipse(this.position.x, this.position.y, this.diameter, this.diameter);
  }
  
  public void update() {
    // speed2 = speed.mult(m/19.0);
    this.position = position.add(speed);
  }
  
  public void border() {
    if (this.position.x > width) {
      this.position.x = 0;
    };
    if (this.position.x < 0) {
      this.position.x = width;
    };
    if (this.position.y > height) {
      this.position.y = 0;
    };
    if (this.position.y < 0) {
      this.position.y = height;
    };
  }
}