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

private final int numberOfCars = 100;
Car[] cars = new Car[numberOfCars];

void setup() {
  size(600,600);
  for(int i=0; i<cars.length; i++) {
    cars[i] = new Car();
    cars[i].setPosition(int(random(width-100)), int(random(30, height-70)));
    color c = color(int(random(255)), int(random(255)), int(random(255)));
    cars[i].setColor(c);
    cars[i].setSpeed(int(random(1,5)));
  }
}

void draw() {
  background(200);
  for (int i=0; i<cars.length; i++) {
    cars[i].draw();
    cars[i].move();
  }
 }

 void mousePressed() {
   Car lola = new Car();
   lola.setPosition(mouseX-50,mouseY);
   color c = color(int(random(255)), int(random(255)), int(random(255)));
   lola.setColor(c);
   lola.setSpeed(int(random(1,5)));
   cars = (Car[]) append(cars, lola);
 }