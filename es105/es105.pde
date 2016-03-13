public class Car {
  private int x;
  private int y;
  
  public Car() {
    this.x = 0;
    this.y = 30;
    
  }
 public void setPosition(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw () {
      stroke(150);
      fill(150);
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

int left = 0;
Car car = new Car();

void setup() {
  size(300,300);
}

void draw() {
  background(200);
  car.setPosition(left,height/2 - 20);
  if (left < width-100) {
    left++;
  }
  car.draw(); 
}

 