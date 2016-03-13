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
  
  public void update(float timeElapsed) {
    this.speed = speed.add(acceleration);
    this.position = position.add(PVector.mult(speed,timeElapsed));
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
  
public void bounce() {
    float r = diameter/2.0;
    if (this.position.x > width-r || this. position.x < r) {
      if (speed.x<1) {
        acceleration.x = 0;
        speed.x = 0;
      } else {
        speed.x = speed.x*(-1);
      }
    };
    if (this.position.y > height-r || this.position.y < r) {
      if (speed.y<1) {
        acceleration.y = 0;
        speed.y = 0;
      } else {
        speed.y = speed.y*(-1);
      }
    };
  }
}