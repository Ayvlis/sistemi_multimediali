class Particle {
  private PVector position;
  private int diameter;
  private PVector spd;
  private PVector spd1;
  
  public Particle(PVector position, PVector spd) {
    this.position = position;
    this.diameter = 10;
    this.spd = spd;
  }
  
  public void display() {
    ellipse(this.position.x, this.position.y, this.diameter, this.diameter);
  }
  
  void update(int m){
    spd1 = spd;
    position = position.add(spd1.mult(m/1000.0)); //posizione = posizione + velocita
  }
}