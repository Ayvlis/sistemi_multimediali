class Particle {
  private PVector position;
  private float diameter;
  private PVector speed;
  private PVector acceleration;
  private color c;
  private float mass;
  private PVector newAcceleration;
  
  public Particle(PVector position, float mass) {
    this.position = position;
    this.speed = new PVector(0,0);
    this.acceleration = new PVector(0,0);
    this.c = color(136,255,0);
    this.mass = mass;
    this.diameter = mass*10;
  }
  
  public void display() {
    fill(c);
    ellipse(this.position.x, this.position.y, this.diameter, this.diameter);
  }
  
  public void update(float timeElapsed) {
    this.speed = speed.add(acceleration);
    this.position = position.add(PVector.mult(speed,timeElapsed));
  }
  
    public void applyForce(PVector force) {
    newAcceleration = force.div(mass);
    acceleration.add(newAcceleration);
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