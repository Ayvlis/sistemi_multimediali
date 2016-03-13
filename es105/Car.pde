public class Car {
  private int x;
  private int y;
    
  private color c;
  
  private int spd;
  

  public Car() {
    this.x = 0;
    this.y = 30;
    this.c = color(255, 0, 0);
    this.spd = 1;
    
  }
 public void setPosition(int x, int y) {
    this.x = x;
    this.y = y;
  }
 public void setColor(color c) {
   this.c = c;
 }

public void setSpeed(int spd) {
  this.spd = spd;
}

private void move () {
        if (x>=width) {
          x = -100;
        }
        x += spd;
  }

  private void draw () {  
      stroke(c);
      fill(c);
      rect(x, y, 100, 40);
      rect(x+20, y-30, 60, 30);
      fill(0);
      stroke(0);
      strokeWeight(3);
      line(x+20, y, x+80, y);
      fill(255);
      ellipse(x+25, y+40, 30, 30);
      ellipse(x+75, y+40, 30, 30);
  }
}