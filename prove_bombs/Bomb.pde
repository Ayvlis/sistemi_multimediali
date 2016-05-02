class Bomb {
  float diameter;
  PVector position;
  int fuse;
  float explosionArea;

  public Bomb(float d, PVector pos, int fuse) {
    this.diameter = d;
    this.position = pos;
    this.fuse = fuse;
    this.explosionArea = this.diameter*2;
  }

  public void display() {
    if (bombTimer!=0) {
      fill(0);
      ellipse(position.x, position.y, this.diameter/2, this.diameter/2);
      pushMatrix();
      translate(position.x+this.diameter/6, position.y-this.diameter/6);
      strokeWeight(2);
      curve(fuse*3, fuse*3, 0, 0, fuse, -fuse, -fuse*3, -fuse*2);
      fill(255,0,0);
      ellipse(fuse, -fuse, this.diameter/6, this.diameter/6);
      popMatrix();
      noFill();
    } else {
      fill(255,0,0, alfa);
      noStroke();
      ellipse(position.x, position.y, this.diameter*2, this.diameter*2);
      fill(255,255,0, alfa);
      ellipse(position.x, position.y, this.diameter*1.5, this.diameter*1.5);
      fill(255, alfa);
      ellipse(position.x, position.y, this.diameter/2, this.diameter/2);
      noFill();
    }
  }
}