class Particle {
  float diameter;
  PVector position;
  
  public Particle (float d, PVector pos) {
    this.diameter = d;
    this.position = pos;
  }
  
  public void display() {
    float r = this.diameter/2;
    fill(255);
    ellipse(position.x, position.y, r, r);
  }
  
}
    